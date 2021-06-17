export MOODLE_DOCKER_WWWROOT=$PWD/iomad/iomad
export MOODLE_DOCKER_DB=pgsql
export MOODLE_DOCKER_WEB_HOST=localhost
export MOODLE_DOCKER_WEB_PORT=8000

git clone -b IOMAD_36_STABLE https://github.com/guillaumerosinosky/iomad.git iomad/iomad
git clone https://github.com/moodlehq/moodle-performance-comparison.git iomad/iomad/moodle-performance-comparison
git clone https://github.com/moodlehq/moodle-docker.git iomad/moodle-docker
#cp iomad/moodle-docker/config.docker-template.php $MOODLE_DOCKER_WWWROOT/config.php
docker-compose -f ./docker-compose-single.yaml stop
docker-compose -f ./docker-compose-single.yaml rm -fv  
docker-compose -f ./docker-compose-single.yaml up  --remove-orphans -d 
sleep 10

# source dump
export PGPASSWORD="m@0dl3ing"
psql -h localhost -U moodle -p 5432 moodle < dump_db_empty.sql

#make site
docker-compose exec webserver php admin/tool/iomadsite/cli/maketestsite.php --size=$1 --nb_users=$2 --nb_courses=$3
export PGPASSWORD="m@0dl3ing"
pg_dump --column-inserts --data-only -h localhost -U moodle moodle >dump_data_$1.sql