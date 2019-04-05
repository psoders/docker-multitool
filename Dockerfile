FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install -y \
       iputils-ping \
       dnsutils \
       telnet \
       netcat \
       wget \
       gnupg \
       curl \
       net-tools \
       inetutils-traceroute \
       vim

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main 10" >  /etc/apt/sources.list.d/pgdg.list \
    && apt-get update \
    && apt-get install -y \
       mysql-client \
       postgresql-client-10

CMD ["bash"]
