FROM debian:wheezy

MAINTAINER Olaf Radicke o.adicke@meteocontol.de

# Set the mount points
VOLUME ["/var/lib/xwiki"]

RUN apt-get update
RUN apt-get install -y openjdk-7-jdk tomcat7 wget unzip
RUN wget -P /tmp http://download.forge.ow2.org/xwiki/xwiki-enterprise-web-7.0.war
RUN unzip -d /var/lib/tomcat7/webapps/xwiki /tmp/xwiki-enterprise-web-7.0.war
RUN wget -P /var/lib/tomcat7/webapps/xwiki/WEB-INF/lib http://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.35/mysql-connector-java-5.1.35.jar
RUN mkdir -p /var/lib/xwiki
RUN chown tomcat7:tomcat7 /var/lib/xwiki
RUN mkdir -p /var/lib/tomcat7/bin
RUN chown tomcat7:tomcat7 /var/lib/tomcat7/bin
RUN apt-get clean

# Inject configuration files
ADD ["files/hibernate.cfg.xml", "files/xwiki.properties", "/var/lib/tomcat7/webapps/xwiki/WEB-INF/"]
ADD ["files/start_xwiki.sh", "/"]

# Define the startup command
CMD ["/start_xwiki.sh"]

# Expose port
EXPOSE 8080


