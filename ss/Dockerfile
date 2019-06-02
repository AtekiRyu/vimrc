# Shadowsocks Docker File
FROM ubuntu:18.04

RUN mkdir /shadowsocks  && cd /shadowsocks \
    && apt-get update \
    && apt-get install -y vim git python-pip libsodium-dev \
    && pip install git+https://github.com/shadowsocks/shadowsocks.git@master \
    && git clone https://github.com/AtekiRyu/vimrc.git \
    && cp vimrc/ss/* . && rm -r vimrc

