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



