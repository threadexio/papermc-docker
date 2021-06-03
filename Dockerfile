FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

# JDK Version to install
ARG JDK=16
ENV JDK "${JDK}"

# Server install location
ENV SDIR "/opt"
ENV SESSION "srv"

############################

ENV VERSION "1.16.5"
ENV BUILD "762"
ENV RAM="2G"
ENV eula="false"

############################

ENV PAPER_JAR "paper-$VERSION-$BUILD.jar"

RUN apt-get -q update
RUN apt-get -q install --no-install-recommends -y screen wget openjdk-${JDK}-jre-headless

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