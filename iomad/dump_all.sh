export PGPASSWORD="m@0dl3ing"
pg_dump -h localhost -p 5432 -U moodle moodle >dump_db1.sql
pg_dump -h localhost -p 5433 -U moodle moodle_ref >dump_ref.sql
pg_dump -h localhost -p 5434 -U moodle moodle >dump_db2.sql

