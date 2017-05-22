FROM photon

MAINTAINER massimo@it20.info

WORKDIR /

RUN tdnf install -y tar gzip sed python python-setuptools && \
    curl -O -L https://github.com/vmware/harbor/releases/download/0.5.0/harbor-online-installer-0.5.0.tgz && \
    tar -xvf harbor-online-installer-0.5.0.tgz && \
    rm harbor-online-installer-0.5.0.tgz
    
WORKDIR /harbor

ADD ./harbor-setupwrapper.sh .

ADD ./entrypointdb.sh .

ADD ./entrypointui.sh .

ADD ./entrypointjobservice.sh .

RUN chmod +x harbor-setupwrapper.sh
