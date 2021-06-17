export MOODLE_DOCKER_DB=pgsql
export MOODLE_DOCKER_WEB_HOST=localhost
export MOODLE_DOCKER_WEB_PORT=8000
export MOODLE_DOCKER_WWWROOT=$PWD/iomad/iomad

for tbl in $(docker-compose exec webserver php admin/tool/generator/cli/maketestplan.php --shortname="ML14238" --size=XS) 
do
    echo $tbl
done;