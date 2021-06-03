FROM ubuntu

ARG VERSION=1.16.5
ARG BUILD=762
ARG JDK=16

ENV RAM="2G"
ENV eula="false"

ENV VERSION "${VERSION}"
ENV BUILD "${BUILD}"
ENV JDK "${JDK}"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -q update
RUN apt-get -q install --no-install-recommends -y wget openjdk-${JDK}-jre-headless

RUN mkdir -p /opt
WORKDIR /opt

RUN wget "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$BUILD/downloads/paper-$VERSION-$BUILD.jar" -O /paper.jar

ADD entry.sh /entry.sh

EXPOSE 25565
ENTRYPOINT bash /entry.sh
CMD [ "" ]