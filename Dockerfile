FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install -y \
       telnet \
       netcat \
       curl \
       vim

CMD ["bash"]
