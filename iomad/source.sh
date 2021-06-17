export PGPASSWORD="m@0dl3ing"
psql -h localhost -U moodle -p 5432 postgres -c "drop database moodle"
psql -h localhost -U moodle -p 5432 postgres -c "create database moodle"
psql -h localhost -U moodle -p 5433 postgres -c "drop database moodle_ref"
psql -h localhost -U moodle -p 5433 postgres -c "create database moodle_ref"
psql -h localhost -U moodle -p 5433 moodle_ref < sequence.sql
psql -h localhost -U moodle -p 5432 moodle < dump_data.sql

