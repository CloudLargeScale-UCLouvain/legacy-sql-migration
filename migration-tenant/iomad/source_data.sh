export ORIGIN_SCHEMA="./db.yaml"
/usr/bin/python3 test.py
export PGPASSWORD="m@0dl3ing"
psql -h localhost -U moodle -p 5432 moodle < dump_data.sql
psql -h localhost -U moodle -p 5434 moodle < dump_data.sql
cat dump_data.sql |grep setval >sequence.sql
psql -h localhost -U moodle -p 5433 moodle_ref < sequence.sql
