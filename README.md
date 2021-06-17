# Tenant sql migration for shared-table based multitenant applications

Tenants migrations scripts based on Foreign Data Wrappers, for shared-table based multitenant applications. 

Modules of [A Methodology for Tenant Migration in Legacy Shared-Table Multi-tenant Applications](https://link.springer.com/chapter/10.1007/978-3-030-78198-9_1) published in the proceedings of the [21st International Conference on Distributed Applications and Interoperable Systems](https://www.discotec.org/2021/dais). The presentation video will be available [here](https://www.discotec.org/2021/programme#scalability-and-elasticity).

Available for :
- Camunda 7.8.0 (usage of https://github.com/guillaumerosinosky/camunda-bpm-platform/tree/7.8.0-fdw - version with [support of external tables](https://github.com/guillaumerosinosky/camunda-bpm-platform/commit/483eb09ccc95cec6dab19c9180633e3be7e48c76))
- Iomad 3.6 (usage of https://github.com/guillaumerosinosky/iomad - version with [support of external tables](https://github.com/guillaumerosinosky/iomad/commit/4d568d87625975654536f121401986b34a3a4565) and additional code for load testing)

Structure: 
* [migration-tenant](migration-tenant): the migration tool 
* [manager-scripts](manager-scripts): Docker images, Helm charts for experimentation, Argo Workflows files, notebooks.
* [ManagerKubernetesExperimentations](ManagerKubernetesExperimentations): simple chart and Docker images for installation of manager modules (Argo, Minio, Jupyer, ...)
* paper results: to be documented

## Kubernetes experimentation

We propose scripts automating the installation and the execution of the experiments. 
They are based on the usage of [Jupyter Notebook](https://jupyter.org/) (for execution of the experiments and results visualization), [Argo Workflows](https://argoproj.github.io/argo-workflows/) (for experimentation orchestration), [Minio](https://min.io/) (for the result files storage), [Mongodb](https://www.mongodb.com/) (for results aggregation and storage, used in notebooks). 

The experiments assume tests on a system with two different stacks: the origin and the destination, each one composed of a web server and a database. A reference database is used for the storage of reference tables (see paper for more informations). Tests are done for various configurations, on Camunda and Iomad.

### Installation

Prerequisite: having a running k8S cluster, with at least one node for manager, configuration set, kubectl and helm v3 installed on it. We use for orchestrator , and it's better the client version is installed as well. We assume the commands are launched on the node chosen as a dedicated manager.

### Iomad preparation

Launch [prepare_iomad.sh](prepare_iomad.sh) script. It will clone the Iomad source code in the needed directory.

### Camunda preparation

Launch [prepare_camunda.sh](prepare_camunda.sh) script. It will clone the Camunda in the needed directory and build it. Be aware that a valid installation of Java 8 is needed to compile.

### Docker images build

A Docker Compose is provided to permit an easy build of the needed images([docker-compose-build.yaml](docker-compose-build.yaml)). It uses a fixed Dockerhub account, so in order to set your custom images, the file should be modified. Be cautious to modify the workflows as well, in order to pass the good images names to the charts.
Once it has been well set, you can use [build_docker_images.sh](build_docker_images.sh). It will build and push on the Docker Repository all the images.

### Infrastructure and node labels

You should have tagged nodes with enough capacity. We advice 8 Go RAM memory (B2ms for tests, Standard D3 v2 for experimentations on Azure) for each node. 
The script [label-nodes](manager-scripts/init/label-nodes.sh) contains the commands labeling the nodes to each corresponding tier. The different modules are deployed specifically on a predefined node, in order to avoid colocation effects. Please set the label accordingly to your cluster. We assume nodes are labeled this way:
- `manager`: the manager node (Jupyter, Minio, Argo Workflows, Mongo, storage of this repository and the results).
- `load`: the node(s) used for load injection
- `webserver`: the node used for the webserver of the origin configuration
- `db`: the node used for the database of the origin configuration
- `webserver2`: the node used for the webserver of the destination configuration
- `db2`: the node used for the database of the destination configuration
- `db-ref`: the node used for the reference database

### Persistent volumes

Persistent volumes are mainly used for the storage of the experiment orchestration, and the experiment results.
The persistent volume needs to be set to the wanted directories, the repository directory being $REPOSITORY_DIR.
- [persistentVolume-moodle-www](manager-scripts/init/persistentVolume-moodle-www.yaml): $REPOSITORY_DIR/iomad/iomad
- [persistentVolume-git](manager-scripts/init/persistentVolume-git.yaml): $REPOSITORY_DIR
- [persistentVolume-jupyter](manager-scripts/init/persistentVolume-jupyter): $REPOSITORY_DIR
- [persistentVolume-mongoxp](manager-scripts/init/persistentVolume-mongoxp.yaml): Any directory with 777 rights.
- [persistentVolume-minio](manager-scripts/init/persistentVolume-minio.yaml): Any directory with 777 rights. 

### Manager Initialization

When all the files well set, you can launch the helper scripts permitting to initialize the manager modules.
You should launch them in the [manager-scripts/init](manager-scripts/init) directory. Please check them carefully to verify you have well set your values:

```
cd manager-scripts/init
./label-nodes
./init-cluster.sh
./init-manager.sh
```

Now, Jupyter, Argo and Minio should be up, in the `manager` namespace. You can access to it using a port-forward or add Ingress to ease access. Be aware the Minio installation is shared between Argo and the experiments (argo-artifacts).
```
# Minio default credentials : AKIAIOSFODNN7EXAMPLE / wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
kubectl port-forward service/argo-artifacts 9000:9000 -n default  --address 0.0.0.0
kubectl port-forward -n argo service/argo-ui 8001:80 --address 0.0.0.0
``` 

## How to launch experiments

### Iomad
Launch dump workflow (generation of dump for tests): need to be done one time for each configuration.
```
cd manager-scripts/xp
argo submit wf-moodle-dump-data.yaml -f ./moodle-fdw-dump.yaml
```

Launch test workflow
```
argo submit wf-moodle-fdw.yaml -f xp1a-fdw-overhead-db/moodle-fdw-ini.yaml
```

### Camunda

To be documented.

## Figures plotting with Jupyter

To be documented.

## Limitations 
- tested on Postgresql exclusively
- caution with the latency induced by the resulting distributed database
- foreign constraints between foreign tables and local tables must be removed
- a way to stop the tenant activity should be used during the migration operation. Use pause/stop tenant feature in the application, coupled to stopping/pausing the influx of requests.
