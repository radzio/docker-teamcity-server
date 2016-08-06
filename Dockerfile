# Dockerfile to build TeamCity server container images.
# Based on Debian.

# sudo docker run -dt --name teamcity_server -p 8111:8111 radzio/docker-teamcity-server

FROM java:8
ENV TC_VERSION 10.0

VOLUME  ["/data/teamcity"]
ENV TEAMCITY_DATA_PATH /data/teamcity

RUN	apt-get update && \
		apt-get install -y wget default-jre && \
		rm -rf /var/lib/apt/lists/*

RUN wget -qO- http://download.jetbrains.com/teamcity/TeamCity-$TC_VERSION.tar.gz | tar xz -C /opt

EXPOSE 8111
CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
