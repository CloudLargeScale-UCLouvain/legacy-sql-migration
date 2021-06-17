import pyrseas
import yaml
import sys
from pyrseas.database import Database
import psycopg2
import os 
import collections
import subprocess
import shlex
import datetime 
import getopt
from dateutil.tz import tzlocal
config = {}
infra = {}
data_source = {}

def run_command_async(command, env = {}):
    if (isinstance(command, list) == False):
        commands = [command]
    else:
        commands=command
    processes = [None] * len(commands)
    for i in range(len(commands)):
        processes[i] = subprocess.Popen(shlex.split(commands[i]), stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    return processes

def wait_for_command_async(processes):
    while processes:
        for i, process in enumerate(processes):
            output = process.stdout.readline().deecode()
            if output == '' and process.poll() is not None:
                processes.remove(process)
                break
            if output:
                now=datetime.datetime.now(tzlocal())
                strnow = now.strftime("%Y-%m-%d %H:%M:%S")
                print ("Log {0} - {1} : ".format(i,strnow) + output.strip())
    
    rc = process.poll()
    return rc    
def run_command(command, shell=False, env = {}):
    if (isinstance(command, list) == False):
        commands = [command]
    else:
        commands=command
    processes = [None] * len(commands)
    for i in range(len(commands)):
        print (commands[i])
        processes[i] = subprocess.Popen(shlex.split(commands[i]), stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=shell, env=env)
    while processes:
        for i, process in enumerate(processes):
            output = process.stdout.readline().decode()
            if output == '' and process.poll() is not None:
                processes.remove(process)
                break
            if output:
                now=datetime.datetime.now(tzlocal())
                strnow = now.strftime("%Y-%m-%d %H:%M:%S")
                print ("Log {0} - {1} : ".format(i,strnow) + output.strip())
    
    rc = process.poll()
    return rc

"""
Generate reference database YAML data structure file
"""
def generate_ref(schema, tables, config):
    print("Generating reference database for tables " + str(tables))
    import copy
    schema_copy = copy.deepcopy(schema)
    
    schema_ref = {
        #"extension plpgsql":schema_copy["extension plpgsql"],
        "schema public": {
            "description":schema_copy["schema public"]["description"],
            "owner":schema_copy["schema public"]["owner"],
            "privileges":schema_copy["schema public"]["privileges"],
        }
    }

    # extract tables and sequences
    for t in schema_copy["schema public"]:
        for tc in tables:
            if "sequence" in t:
                #print(schema_copy["schema public"][t]["owner_table"])
                if schema_copy["schema public"][t]["owner_table"] == tc:
                    print("found " + t)
                    schema_ref["schema public"][t] = schema_copy["schema public"][t]
                    continue
            if "table" in t:
                if "table " + tc == t:
                    schema_ref["schema public"][t] = schema_copy["schema public"][t]
                    
                    # add trigger
                    for field in schema_copy["schema public"][t]["columns"]:
                        if "default" in field[list(field.keys())[0]] and "nextval" in field[list(field.keys())[0]]["default"]:
                            import re
                            #found sequence, get sequence name
                            seq = re.search("\\'.*\\'", field[list(field.keys())[0]]["default"]).group(0).replace("'","")

                            # add trigger function
                            schema_ref["schema public"]["function " +  "trigger_{}_fun()".format(tc)] = {
                                "language":"plpgsql",
                                "owner": config["user"],
                                "returns": "trigger",
                                "source":"\r\nBEGIN\r\nNEW.id :=  nextval('{}'::regclass);\r\n return NEW;\r\nEND;\r\n".format(seq)
                            }
                            schema_ref["schema public"][t]["triggers"] = {
                                "trigger_user": {
                                    "condition": "((new.id IS NULL) OR (new.id = 0))",
                                    "events": ["insert"],
                                    "level": "row",
                                    "procedure": "public." + "trigger_{}_fun".format(tc),
                                    "timing":"before"
                                }
                            }

                            

                    continue
    #yaml.dump(schema_ref, sys.stdout)       
    return schema_ref
    
"""
Generate database with FDW, foreign tables and without sequences/default id
"""
def generate_database(schema, tables, config):
    print("Generating database for tables " + str(tables))
    import copy
    schema_copy = copy.deepcopy(schema)

    # scan table YAML structure for processing
    for t in schema["schema public"].keys():
        # remove foreign key if references foreign table
        if "table" in t and "foreign_keys" in schema_copy["schema public"][t]:
            for foreign_key in list(schema_copy["schema public"][t]["foreign_keys"].keys()).copy():
                foreign_table = schema_copy["schema public"][t]["foreign_keys"][foreign_key]["references"]["table"]
                if foreign_table in tables:
                    print("Remove reference to " + foreign_table + " in " + t)
                    del schema_copy["schema public"][t]["foreign_keys"][foreign_key]
        for tc in tables:
            # remove sequences 
            if "sequence" in t and schema_copy["schema public"][t]["owner_table"] == tc:
                #print("remove sequence " + tc)
                del schema_copy["schema public"][t]
                break
            # replace table by foreign tables
            if "table" in t and "table " + tc == t:
                #print("make foreign table " + tc)
                schema_copy["schema public"]["foreign " + t] = schema_copy["schema public"].pop(t)
                schema_copy["schema public"]["foreign " + t]["options"] = ["schema_name=public", "table_name=" + tc]
                schema_copy["schema public"]["foreign " + t]["server"] = config["server"]
                
                # remove sequence reference from fields
                for field in schema_copy["schema public"]["foreign " + t]["columns"]:
                    if "default" in field[list(field.keys())[0]] and "nextval" in field[list(field.keys())[0]]["default"]:
                        del field[list(field.keys())[0]]["default"]
                    
                    break
                
    return schema_copy

"""
Generate sql script
"""
def generate_init_sql(schema, config):
    class Opts:
        pass
    opts = Opts()
    opts.schemas=["public"]
    opts.revert = False
    cfg = {
        "database": {
            "dbname":config["dbname"],
            "host":config["host"],
            "port":config["port"],
            "username":config["user"],
            "password":config["password"]
        },
        "options":opts
    }
    db = Database(cfg)
    stmts = db.diff_map(schema)
    return stmts

"""
    script = ""
    for stmt in stmts:
        if isinstance(stmt, tuple):
            outstmt = "".join(stmt) + '\n'
        else:
            outstmt = "%s;\n" % stmt
        script += outstmt
    return script
"""


"""
Launch query on db
"""

def launch_query(config_db, query):
    conn = psycopg2.connect("host = '{0}' dbname = '{1}' user = '{2}' password = '{3}' port = {4}".
                                    format(config_db["host"], config_db["dbname"], config_db["user"], config_db["password"], config_db["port"]))
    conn.autocommit = True

    curs = conn.cursor()
    conn.set_isolation_level(0)        
    curs.execute(query)    
    return curs.fetchall()
    

"""
Launch script on db described by config
"""
def launch_script(config_db, queries, system=False):
    # TODO : remove double configuration
    if system == True:
        db = "postgres"
    else:
        db = config_db["dbname"]

    conn = psycopg2.connect("host = '{0}' dbname = '{1}' user = '{2}' password = '{3}' port = {4}".
                                    format(config_db["host"], db, config_db["user"], config_db["password"], config_db["port"]))
    conn.autocommit = True

    curs = conn.cursor()
    for i, stmt in enumerate(queries):
        if isinstance(stmt, tuple):
            query = "".join(stmt) + '\n'
        else:
            query = "%s;\n" % stmt
            print("{} - {}".format(i, query))
            if query.strip() == "":
                continue
        if i % 1 == 0:
            conn.set_isolation_level(0)        
            curs.execute(query)
            query = ""
    if query != "":
        conn.set_isolation_level(0) 
        curs.execute(query)

def launch_psql_script(config_db, queries, system=False):
    if "psql" not in config["metadata"] or config["metadata"]["psql"] != True:
        return launch_psql_script(config_db, queries, system)

    if system == True:
        db = "postgres"
    else:
        db = config_db["dbname"]

    f = open('test.sql', 'w')
    for i, stmt in enumerate(queries):
        if isinstance(stmt, tuple):
            query = "".join(stmt) + '\n'
        else:
            query = "%s;\n" % stmt
            #print("{} - {}".format(i, query))
            f.write(query)
            if query.strip() == "":
                continue    
    f.close()
    
    print(run_command("psql -h {} -U {} -p {}  {} -f test.sql".format(config_db["host"], config_db["user"], config_db["port"], db), shell=False, env={'PGPASSWORD': config_db["password"]}))
    ##print(run_command('psql "postgresql://{}:{}@{}:{}/{}" -f test.sql'.format(config_db["user"], config_db["password"], config_db["host"], config_db["port"], db), shell=True))

def old_get_tenant_tables(data_source, config):
    tenant_tables = collections.OrderedDict()
    for item, doc  in data_source["schema public"].items():
        if "table" in item:
            fields=[]            
            table_name = item.split(" ")[1]
            for value_field in data_source["schema public"][item]["columns"]:
                fields.append(list(value_field.keys())[0])
                        
            for dynamic_table in config["metadata"]["tenant"]["tenant_dynamic_tables"]:
                d = dynamic_table[list(dynamic_table.keys())[0]]
                if d["tableName"] != "*":
                    if d["tableName"] == table_name:
                        #print("table_name {} : {}".format(table_name, d["fields"][0]))
                        
                        tenant_tables[table_name] = {
                            "field": d["fields"][0],
                            "subquery": d["subquery"].replace(":field", d["fields"][0])
                        }
                else:
                    if "except" in d:
                        found = False
                        for t in d["except"]:
                            if t == table_name:
                                found = True
                                break
                        if found == True:
                            continue  
                    # no found table
                    for field in d["fields"]:
                        if field in fields:
                            #print("table_name {} : {}".format(table_name, field))
                            
                            tenant_tables[table_name] = {
                                "field": d["fields"][0],
                                "subquery": d["subquery"].replace(":field", field)
                            }                            
                            break
    return tenant_tables    

def load_tables_param():
    all_tables = []
    tenant_tables = []
    detailed_tenant_tables = collections.OrderedDict()
    for item, doc  in data_source["schema public"].items():
        if "table" in item:
            continue_processing = True
            is_fdw = True
            ignore_table = False
            subquery = None
            fields=[]            
            table_name = item.split(" ")[1]
            all_tables.append(table_name)
            for value_field in data_source["schema public"][item]["columns"]:
                fields.append(list(value_field.keys())[0])

            # for each database table     
            for dynamic_table in config["metadata"]["tenant"]["tenant_dynamic_tables"]:
                d = dynamic_table[list(dynamic_table.keys())[0]]
                
                # tableName is specific
                if d["tableName"] != "*":
                    # config applies to each tables

                    # get table names as list
                    if isinstance(d["tableName"],list):
                        tables_config = d["tableName"]
                    else:  
                        tables_config = [d["tableName"]]

                    # for each table name in dynamic_tenant_tables
                    for table_config in tables_config:
                        if table_config == table_name:
                            # current table is found
                            is_fdw = False
                            # if fieldName is found in table's fields
                            if "fields" in d:
                                # a subquery to get tenant exists
                                subquery = {
                                    "field": d["fields"][0],
                                    "subquery": d["subquery"].replace(":field", d["fields"][0])
                                }    
                            

                else:
                    # table is specifically nominated for exclusion
                    if "except" in d:
                        found = False
                        for t in d["except"]:
                            if t == table_name:
                                ignore_table = True
                                continue_processing = False
                                break
                        if found == True:
                            continue                
                    # no found table
                    for field in d["fields"]:
                        if field in fields:
                            is_fdw = False

                            subquery = {
                                "field": field,
                                "subquery": d["subquery"].replace(":field", field)
                            }                        
                            break
                if not(continue_processing):
                    break
            if not(is_fdw) and not(ignore_table):
                tenant_tables.append(table_name)
                detailed_tenant_tables[table_name] = subquery
                if subquery is None:
                    print("   tenant table {} : not bounded".format(table_name))
                else:
                    print("   tenant table {} : bounded {} - ".format(table_name, subquery["field"]))
            else:
                if ignore_table:
                    print("reference table {} (excluded).".format(table_name))
                else:
                    print("reference table {}".format(table_name))

             
    ref_tables = [x for x in all_tables if x not in tenant_tables]
    return all_tables, ref_tables, tenant_tables, detailed_tenant_tables

def init_db(): 
    config_ref = infra["ref"]["config"]
    
    # reset database
    reset_script = ["DROP DATABASE IF EXISTS {}".format(config_ref["dbname"]),
        "CREATE DATABASE {}".format(config_ref["dbname"])]
    for q in reset_script:
        launch_script(config_ref, [q], True)

    for resource in infra:
        if resource == "ref":
            continue
        config_db = infra[resource]["config"]        
        reset_script = ["DROP DATABASE IF EXISTS {};".format(config_db["dbname"]), "CREATE DATABASE {}".format(config_db["dbname"])]
        for q in reset_script:
            launch_script(config_db, [q], True)
    
    all_tables, ref_tables, list_tenant_tables, tenant_tables = load_tables_param()

    print("Generate and launch reference database script")
    ref = generate_ref(data_source, ref_tables, config_ref)
    script = generate_init_sql(ref, config_ref)
    launch_psql_script(config_ref, script)

    for resource in infra:
        if resource == "ref":
            continue

        config_db = infra[resource]["config"]
        print("Generate db script for resource " + resource)
        db = generate_database(data_source, ref_tables, config_ref)    
        script = generate_init_sql(db, config_db)

        fdw_script = ["DROP EXTENSION IF EXISTS postgres_fdw CASCADE; CREATE EXTENSION postgres_fdw VERSION '1.0'",
            "create SERVER {} foreign data WRAPPER postgres_fdw options (host '{}', port '{}', dbname '{}');".format(config_ref["server"], config_ref["internal_host"], 5432, config_ref["dbname"]),
            "create user mapping for current_user server psql1 options(user '{}', password '{}');".format(config_ref["user"], config_ref["password"])]
        launch_script(config_db, fdw_script)

        launch_psql_script(config_db, script)

def describe_tenants():
    for resource in infra:
        if resource == "ref":
            continue

        res = launch_query(infra[resource]["config"], config["metadata"]["tenant"]["describe_resource_query"])
        print("Resource {} : {}".format(resource, res))

def export(arg):
    # TODO: check export type
    print("Export" + arg)
    all_tables, ref_tables, tenant_tables, detailed_tenant_tables = load_tables_param()
    tables = {
        "reference_tables": ref_tables,
        "tenant_tables": tenant_tables
    }
    with open('export.yaml', 'w') as f:
        print(yaml.dump(tables, f))


def migrate(tenant_id, origin, destination):
    print("Migrate")
    resource_destination = infra[destination]["config"]
    resource_origin = infra[origin]["config"]
    fdw_script = ["drop server if exists psql_target cascade;",
    "create server psql_target foreign data wrapper postgres_fdw options (host '{}', port '{}', dbname '{}');".format(resource_destination["internal_host"], 5432, resource_destination["dbname"]),
    "create user mapping for {} server psql_target options(user '{}', password '{}');".format(resource_origin["user"], resource_destination["user"], resource_destination["password"]),
    "drop schema if exists psql_target;",
    "create schema if not exists psql_target;",
    "import foreign schema public from server psql_target into psql_target;"]
    launch_script(infra[origin]["config"], fdw_script)

    #tenant_tables = get_tenant_tables(data_source, config)
    all_tables, ref_tables, list_tenant_tables, tenant_tables = load_tables_param()

    print("Delete previous tenant data on target")
    script = []
    script.append("SET session_replication_role = replica;")
    for tenant in reversed(tenant_tables):
        if tenant_tables[tenant] is not None:
            script.append("DELETE FROM psql_target.{} WHERE {};".format(tenant, tenant_tables[tenant]["subquery"].replace(":tenantId", str(tenant_id))))
    script.append("SET session_replication_role = DEFAULT;")
    launch_psql_script(resource_origin, script)

    print("Copy tenant data from origin to target")
    script = []
    script.append("SET session_replication_role = replica;")
    for tenant in tenant_tables:
        if tenant_tables[tenant] is not None:
            script.append("insert into psql_target.{} select * FROM public.{} WHERE {} ".format(tenant, tenant, tenant_tables[tenant]["subquery"].replace(":tenantId", str(tenant_id))))
    script.append("SET session_replication_role = DEFAULT;")
    launch_psql_script(resource_origin, script)

    print("Delete tenant data from origin")
    script = []
    script.append("SET session_replication_role = replica;")
    for tenant in reversed(tenant_tables):
        if tenant_tables[tenant] is not None:
            script.append("DELETE FROM public.{} WHERE {};".format(tenant, tenant_tables[tenant]["subquery"].replace(":tenantId", str(tenant_id))))
    script.append("SET session_replication_role = DEFAULT;")
    launch_psql_script(resource_origin, script)


if __name__== "__main__":
    if ("CONFIG_DIRECTORY" not in os.environ):
        print("CONFIG_DIRECTORY not defined.")
        exit(1)
    config_directory = os.environ.get("CONFIG_DIRECTORY", "./")
    print("Configuration directory: " + config_directory)
    config_yaml = config_directory + "config.yaml"
    config = yaml.load(open(config_yaml), Loader=yaml.FullLoader)
    data_source = yaml.load(open(config_directory + config["metadata"]["database_schema_file"], 'r'), Loader=yaml.FullLoader)
    
    infra_file = os.environ.get("INFRA_FILE", config["metadata"]["infra_file"])
    infra = yaml.load(open(config_directory + infra_file, 'r'), Loader=yaml.FullLoader)

    try:
        opts, args = getopt.getopt(sys.argv[1:], "im:de:", ["init", "migrate=", "describe", "export"])
    except getopt.GetoptError:
        print("Parameters : init / migrate <tenant id>,<target>")
        sys.exit(2)
    operation = None
    for opt, arg in opts:
        if opt in ("-i", "--init"):
            operation = "INIT"
        elif opt in ("-m", "--migrate"):
            operation = "MIGRATE"
            import re
            ar = re.split(",", arg)
            #ar = arg.split(",")
            if len(ar) == 3:
                tenant = ar[0]
                res_origin = ar[1]
                if res_origin not in infra:
                    print("Unknown origin resource")
                    exit(2)
                res_destination = ar[2]
                if res_destination not in infra:
                    print("Unknown destination resource")
                    exit(2)
            else:
                print("Migration syntax : <tenant identifier>,<origin resource id>,<destination resource id>")
                exit(2)
        elif opt in ("-d", "--describe"):
            operation = "DESCRIBE"
        elif opt in ("-e", "--export"):
            operation = "EXPORT"            
        else:
            print("Unknown operation " + opt)

    print("Operation : {}".format(operation))
    if operation is None:
        exit(2)

    if operation == "INIT":
        init_db()
        #init_db(config_reference, config_db2, False)    
    elif operation == "MIGRATE":
        migrate(tenant, res_origin, res_destination)
    elif operation == "DESCRIBE":
        describe_tenants()
    elif operation == "EXPORT":
        export(arg)