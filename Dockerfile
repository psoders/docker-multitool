FROM ubuntu:22.04

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
       vim \
       jq \
       mysql-client \
       postgresql-client \
       redis-tools \
       kafkacat \
    && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
