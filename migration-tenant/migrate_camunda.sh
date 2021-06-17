export CONFIG_DIRECTORY=$PWD/camunda/
export INFRA_FILE=infra-intern.yaml
python3 migrate.py "$@"