FROM ubuntu:jammy AS base
ARG CUR_UID
ARG CUR_GID
WORKDIR /development

RUN apt update && apt upgrade -y

RUN apt-get install -y --no-install-recommends --no-install-suggests --no-upgrade \
    git python3-dev python3-pip python-is-python3 \
    redis-server software-properties-common mariadb-server mariadb-client \
    xvfb libfontconfig wkhtmltopdf build-essential python3.10-venv

RUN echo -e "[mysqld]\r\ncharacter-set-client-handshake = FALSE\r\ncharacter-set-server = utf8mb4\r\ncollation-server = utf8mb4_unicode_ci\r\n\r\n[mysql]\r\ndefault-character-set = utf8mb4" >> /etc/mysql/my.cnf

RUN apt-get install -y --no-install-recommends --no-install-suggests --no-upgrade curl
RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh

RUN apt-get -y install nodejs

RUN corepack enable

RUN pip3 install frappe-bench

RUN apt-get install -y --no-install-recommends --no-install-suggests --no-upgrade  cron
RUN groupadd -g $CUR_GID appuser \
    && useradd -m -u $CUR_UID -g appuser appuser
USER appuser
