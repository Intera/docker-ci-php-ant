FROM intera/ci-php:8.1-ubuntu

RUN apt-get update \
	&& apt-get dist-upgrade -y

RUN apt-get install -y \
	    gettext \
	    curl \
	    default-jdk \
	    ant \
	    mysql-client \
	    pdftk-java

RUN apt-get install -y ruby clang gcc make ruby-dev libffi-dev

RUN gem install compass --no-document

# install php igbinary extension via PECL
#RUN pecl install igbinary && docker-php-ext-enable igbinary
RUN apt-get install -y --no-install-recommends \
		php8.1-igbinary

RUN apt-get -y purge clang gcc make ruby-dev libffi-dev \
    && apt-get --purge -y autoremove \
	&& apt-get autoclean \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
