export PGPASSWORD="m@0dl3ing"
pg_dump --column-inserts --data-only -h localhost -U moodle moodle >dump_data.sql
#cat dump_data.sql |grep setval > sequence.sql

