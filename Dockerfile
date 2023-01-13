FROM tomcat:9-jdk11

LABEL maintainer="kempegowda"

COPY /var/lib/jenkins/workspace/Docker_cicd/target/WebApp.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
