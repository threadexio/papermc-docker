FROM ubuntu

ARG VERSION=1.16.5
ARG BUILD=762
ARG JDK=16

ENV RAM="2G"
ENV eula="false"

ENV SDIR "/opt"
ENV SESSION "srv"
ENV VERSION "${VERSION}"
ENV BUILD "${BUILD}"
ENV JDK "${JDK}"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -q update
RUN apt-get -q install --no-install-recommends -y screen wget openjdk-${JDK}-jre-headless

RUN wget "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$BUILD/downloads/paper-$VERSION-$BUILD.jar" -O /paper.jar

ADD wrapper.sh /usr/local/bin
WORKDIR /usr/local/bin
RUN chmod 755 wrapper.sh

# Setup all actions for the wrapper
RUN ln -s wrapper.sh start
RUN ln -s wrapper.sh reload
RUN ln -s wrapper.sh stop
RUN ln -s wrapper.sh console
RUN ln -s wrapper.sh execute
RUN ln -s wrapper.sh version

EXPOSE 25565

WORKDIR $SDIR
ADD entry.sh /entry.sh
ENTRYPOINT bash /entry.sh
CMD [ "" ]