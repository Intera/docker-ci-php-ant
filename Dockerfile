FROM intera/docker-ci-php:5.6-ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN apt-get update \
    && apt-get dist-upgrade -y

RUN apt-get install -y \
	    gettext \
	    curl \
	    default-jdk \
	    ant \
	    ruby-compass \
	    mysql-client

RUN apt-get --purge -y autoremove \
	&& apt-get autoclean \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
