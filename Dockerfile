# Use a Debian-based image because ./Sencha...run doesn't work on Alpine
FROM openjdk:7u151-jre-slim

ARG SENCHA_VERSION="4.0.4.84"

RUN apt-get update -qq \
    && apt-get install -qq bzip2 wget \
    && wget http://cdn.sencha.com/cmd/${SENCHA_VERSION}/SenchaCmd-${SENCHA_VERSION}-linux-x64.run.zip \
    && unzip SenchaCmd-${SENCHA_VERSION}-linux-x64.run.zip \
    && chmod +x SenchaCmd-${SENCHA_VERSION}-linux-x64.run \
    && ./SenchaCmd-${SENCHA_VERSION}-linux-x64.run --mode unattended --prefix /usr/local/ \
    && echo "/usr/local/Sencha/Cmd/${SENCHA_VERSION}/sencha \$@" > /usr/local/bin/sencha \
    && chmod +x /usr/local/bin/sencha \
    && rm -rf Sencha* \
    && rm -rf /var/lib/apt/lists/*

