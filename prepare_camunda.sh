cd camunda
git clone -b 7.8.0-fdw https://github.com/guillaumerosinosky/camunda-bpm-platform.git camunda-bpm-platform/camunda-bpm-platform
cd camunda-bpm-platform/camunda-bpm-platform
mvn install -P tomcat,h2 -Dmaven.test.skip=true
cp distro/tomcat/distro/target/camunda-bpm-tomcat-7.8.0.tar.gz ../files/
cd ../../init-tenants
mvn clean install 
