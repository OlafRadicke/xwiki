# Introduction # 

This project contains the Dockerfile for building a container running XWiki 7.0 on Tomcat with PostgreSQL as backend
(in a other container).

# Building #

Just run `docker build .` and you should have your image ready in your docker repository.

# Running #

When running the container you must specify the following information:

Valume: `/var/lib/xwiki` for XWiki permament data.
Ports: 8080

## Logging ##

* [External docu](http://platform.xwiki.org/xwiki/bin/view/AdminGuide/Logging)
  * Log configuration:  WEB-INF/classes/logback.xml
  * Lof file: tomcat/logs/catalina.out
  
# docker compose suport #

You find a (example) file for docker compose with name "docker-compose.yml"

# systemd support #


You find a (example) files for systed with name "xwiki.service" and "xwikiposgres.servce". Copy this files to 
/etc/systemd/system/. Call:

```
systemctl daemon-reload
```
for reload systemd config and than start the container with:
 ```
 systemctl start xwikipostgres && systemctl start xwiki
 ```
 
 enable for auto start wih this:
 ```
 systemctl enable xwikipostgres && systemctl enable xwiki
 ```


