FROM openjdk:8-jre-slim
# Inspired from https://github.com/pedrocesar-ti/distributed-jmeter-docker/blob/master/Dockerfile
MAINTAINER Guillaume Rosinosky<guillaumerosinosky@yahoo.fr>
ENV JMETER_VERSION 5.2.1
ENV JMETER_HOME /apache-jmeter-$JMETER_VERSION/
ENV PATH $JMETER_HOME/bin:$PATH
ENV MOODLE_DOCKER_WEB_HOST localhost
ENV MOODLE_DOCKER_WEB_PORT 8000
RUN apt-get update && \
    apt-get -y install \
    wget git curl unzip
RUN wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz && \
    tar -xzf apache-jmeter-$JMETER_VERSION.tgz && \
    rm apache-jmeter-$JMETER_VERSION.tgz  
RUN wget https://dl.minio.io/client/mc/release/linux-amd64/mc -P /usr/bin/
RUN chmod +x /usr/bin/mc
RUN git clone https://github.com/guillaumerosinosky/moodle-performance-comparison.git /mpc
WORKDIR /mpc
RUN cp jmeter_config.properties.dist jmeter_config.properties
RUN wget https://jmeter-plugins.org/files/packages/jpgc-tst-2.5.zip
RUN unzip jpgc-tst-2.5.zip -d /apache-jmeter-$JMETER_VERSION/; rm jpgc-tst-2.5.zip
RUN cp webserver_config.properties.dist  webserver_config.properties
RUN echo "siteversion=\"2018120307.01\"\nsitebranch=\"36\"\nsitecommit=\"681f6c345b IOMAD: Extra text on add course to company form closes #1245\"" > site_data.properties
RUN echo "jmeter_path=$JMETER_HOME" > jmeter_config.properties
ENTRYPOINT [ "./test_runner.sh", "testGrp", "test", "testplan.jmx", "users.csv", "site_data.properties", "-t", "30", "-h", "$MOODLE_DOCKER_WEB_HOST", "-p", "$MOODLE_DOCKER_WEB_PORT"]
# ./test_runner.sh testGrp test testplan.jmx users.csv site_data.properties -t 30