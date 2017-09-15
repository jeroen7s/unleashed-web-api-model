FROM node:alpine
MAINTAINER Unleashed <technology@unleashed.com>

WORKDIR /dapperdox

RUN apk --update add wget \
    && wget https://github.com/DapperDox/dapperdox/releases/download/v1.1.1/dapperdox-1.1.1.linux-amd64.tgz --no-check-certificate \
    && tar -zxf dapperdox-*.tgz --strip-components=1

CMD cd /model && yarn install && ./build.js && cd /dapperdox && ./dapperdox -spec-dir=/model/output -bind-addr=0.0.0.0:3000 -assets-dir=/model/uwa