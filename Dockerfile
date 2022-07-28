FROM ubuntu:22.04 as kcatbuild

RUN apt-get update \
    && apt-get install -y \
       curl \
       unzip \
       pkg-config build-essential cmake libtool libssl-dev zlib1g-dev libzstd-dev libsasl2-dev \
       libjansson-dev libcurl4-openssl-dev librdkafka-dev libyajl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -O https://github.com/edenhill/kcat/archive/refs/tags/1.7.1.zip && unzip 1.7.1.zip
RUN cd kcat-1.7.1 \
    && ./bootstrap.sh --no-enable-static

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
       libssl3 \
       ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=kcatbuild /kcat-1.7.1/kcat /bin/kafkacat

CMD ["bash"]
