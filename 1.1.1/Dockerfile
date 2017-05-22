FROM photon:1.0

MAINTAINER massimo@it20.info

WORKDIR /

RUN tdnf install -y tar gzip sed python python-setuptools && \
    curl -O -L https://github.com/vmware/harbor/releases/download/v1.1.1/harbor-online-installer-v1.1.1.tgz && \
    tar -xvf harbor-online-installer-v1.1.1.tgz && \
    rm harbor-online-installer-v1.1.1.tgz
    
WORKDIR /harbor

ADD ./harbor-setupwrapper.sh .

ADD ./entrypointdb.sh .

ADD ./entrypointui.sh .

ADD ./entrypointjobservice.sh .

ADD ./entrypointadminserver.sh .

RUN chmod +x harbor-setupwrapper.sh
