FROM ubuntu:latest
RUN apt update && \
    apt install -y curl && \
    apt install -y python3 && \
    apt install -y nmap && \
    apt install -y net-tools && \
    apt install -y iproute2 && \
    apt install -y iputils-ping

WORKDIR /tmp
COPY callhome.sh .

