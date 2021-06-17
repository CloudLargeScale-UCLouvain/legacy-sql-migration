FROM camunda/camunda-bpm-platform:tomcat-7.8.0
# install real tar instead of buggy busybox's tar
COPY target/camunda-init-users-tenants-0.0.1-SNAPSHOT.war /camunda/webapps/
RUN mkdir /camunda/webapps/init-tenants
RUN unzip /camunda/webapps/camunda-init-users-tenants-0.0.1-SNAPSHOT.war -d /camunda/webapps/init-tenants
RUN rm /camunda/webapps/camunda-init-users-tenants-0.0.1-SNAPSHOT.war 
#RUN rm -rf /camunda/webapps/camunda-invoice
#RUN rm -rf /camunda/webapps/camunda-welcome