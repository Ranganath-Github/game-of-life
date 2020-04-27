FROM tomcat:8.0.20-jre8
COPY target/gameoflife*.war /usr/local/tomcat/webapps/gameoflife.war
