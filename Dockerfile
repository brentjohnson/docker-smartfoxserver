FROM centos:latest

ENV SFS_VERSION 2_14_0
ENV SFS_PATCH 2.16.3

RUN yum install -y unzip

RUN curl -s https://www.smartfoxserver.com/downloads/sfs2x/SFS2X_unix_${SFS_VERSION}.tar.gz | tar  -C /opt -xzvf -

WORKDIR /opt/SmartFoxServer_2X

RUN curl -sO https://www.smartfoxserver.com/downloads/sfs2x/patches/SFS2X-Patch-${SFS_PATCH}.zip \
    && unzip SFS2X-Patch-${SFS_PATCH}.zip \
    && cd SFS2X-Patch-${SFS_PATCH} \
    && ./install-linux.sh \
    && cd .. \
    && rm -rf SFS2X-Patch-${SFS_UPDATE}.zip SFS2X-Patch-${SFS_PATCH}

EXPOSE 8080 8443 9933

WORKDIR /opt/SmartFoxServer_2X/SFS2X

CMD ["sh", "sfs2x.sh"]
