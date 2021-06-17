export MOODLE_DOCKER_WWWROOT=$PWD/iomad/iomad
export MOODLE_DOCKER_DB=pgsql
export MOODLE_DOCKER_WEB_HOST=localhost
export MOODLE_DOCKER_WEB_PORT=8000

git clone -b IOMAD_36_STABLE https://github.com/guillaumerosinosky/iomad.git iomad/iomad
git clone https://github.com/moodlehq/moodle-performance-comparison.git iomad/iomad/moodle-performance-comparison
git clone https://github.com/moodlehq/moodle-docker.git iomad/moodle-docker
cp iomad/moodle-docker/config.docker-template.php $MOODLE_DOCKER_WWWROOT/config.php
docker-compose rm -fv  
docker-compose up --remove-orphans -d
sleep 5
cd migration-tenant
export ORIGIN_SCHEMA=./db.yaml
/usr/bin/python3 ./test.py
./source_data.sh
cd ..
# init, admin/test : already present in dump
#iomad/moodle-docker/bin/moodle-docker-compose exec webserver php admin/cli/install_database.php --agree-license --fullname="Docker moodle" --shortname="docker_moodle" --adminpass="test" --adminemail="guillaume.rosinosky@gmail.com"
#make site
docker-compose exec webserver php admin/tool/iomadsite/cli/maketestsite.php 