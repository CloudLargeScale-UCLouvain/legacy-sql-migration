export PGPASSWORD="m@0dl3ing"
psql -h localhost -U moodle -p 5433 moodle_ref < sequence.sql
psql -h localhost -U moodle -p 5432 moodle < dump_data.sql

