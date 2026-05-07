FROM lcr.loongnix.cn/library/debian:unstable

RUN apt update && apt install -y git \
    golang \
    make \
    libseccomp-dev \
    wget \
    build-essential

RUN wget 'https://github.com/loongarch64-releases/promu/releases/download/0.18.1/promu-0.18.1.linux-loong64.tar.gz' && \
    tar xf promu-0.18.1.linux-loong64.tar.gz && \
    cp promu-0.18.1.linux-loong64/promu /usr/bin/promu && \
    rm promu-0.18.1.linux-loong64.tar.gz
    

ENV NODE_EXPORTER_VERSION=''

CMD ["sh", "-c","/workspace/process_version.sh $NODE_EXPORTER_VERSION"]
