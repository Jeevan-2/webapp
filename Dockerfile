FROM tomcat:latest

LABEL maintainer="kempegowda"

ADD ./target/WebApp.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
