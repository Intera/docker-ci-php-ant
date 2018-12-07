FROM intera/docker-ci-php:7.2-ubuntu

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
