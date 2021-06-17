# Camunda Docker images and load test

## Test

You need Docker and Docker Compose for these scripts to work. Java 8 is also needed.
To test the installation, you should first build the specific version of Camunda. The modification is easy and straightforward : add the possibility to use foreign tables (see 483eb09ccc95cec6dab19c9180633e3be7e48c76)
```
sudo apt install openjdk-8-jdk
sudo update-alternatives --config java
./build_camunda780.sh
```

Once it is build, you can test with the following command :
```
docker-compose up --build
```
Login on Camunda with http://localhost:8081/camunda or http://localhost:8082/camunda with demo / demo.

On the first launch, the database is not split, there are two separate instances. Use the migration tool in [../migration-tenant](../migration-tenant) accordingly to prepare a split installation.

