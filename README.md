# Introduction# 

This project contains the Dockerfile for building a container running XWiki 7.0 on Tomcat with MySQL as a database.

# Building #

Just run `docker build .` and you should have your image ready in your docker repository.

# Running #

When running the container you must specify the following information:

* Where to mount `/var/lib/mysql` for database stored data.
* Where to mount `/var/lib/xwiki` for XWiki permament data.
* Where to map port 8080.

Not specifying mount points will make data stored in the wiki disappear when the container is stopped.

Not specifying the port mapping will make XWiki inaccessible from the host.

Here it is the command line to use for starting the XWiki container:

    docker run -v HOST_DIR_FOR_XWIKI_DATA:/var/lib/xwiki -v HOST_DIR_FOR_MYSQL_DATA:/var/lib/mysql -p HOST_PORT_FOR_ACCESSING_XWIKI:8080 CONTAINER_ID

Once the container is started, you can open a browser and connect to `http://host:HOST_PORT_FOR_ACCESSING_XWIKI/xwiki`

## Making data dir accessible

In order to make `HOST_DIR_FOR_XWIKI_DATA` and `HOST_DIR_FOR_MYSQL_DATA` accessible by the container, they must be executable and writable by the `tomcat7` (`UID 101`, `GID 102`) and `mysql` (`UID 103`, `GID 104`) container users - which might not exist in your host.

In order to avoid writing problems do a `chown 101:103` on `HOST_DIR_FOR_XWIKI_DATA`, and `chown 102:104` on `HOST_DIR_FOR_MYSQL_DATA`.

# Create images #

```
docker build -t xwiki:1 .
docker push 10.24.1.97:5000/xwiki:1

```
# Push images in registry #

```
docker push 10.24.1.97:5000/xwiki:1
```

# Using imaage from registry #

In interactive mode without persistence.

```
docker run --rm -i -t -p 8080:8080 xwiki:1

```

## Logging ##

* [External docu](http://platform.xwiki.org/xwiki/bin/view/AdminGuide/Logging)
  * Log configuration:  WEB-INF/classes/logback.xml
  * Lof file: tomcat/logs/catalina.out

# Disclaimer #

I still need to find a way to shut things down gracefully, so do not use this in production :)

