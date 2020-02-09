FROM ubuntu:bionic
WORKDIR /usr/src/app
ADD ./caldera-src /usr/src/app
ADD ./JollyRoger /usr/src/app/plugins/stockpile
ENV GOPATH=/usr/bin/go
RUN apt-get update && \
    apt-get install python3 python3-pip golang -y && \
    pip3 install --no-cache-dir -r requirements.txt
ENTRYPOINT ["python3", "server.py"]
