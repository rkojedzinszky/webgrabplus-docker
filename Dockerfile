FROM debian:jessie

MAINTAINER krichy@nmdps.net

RUN sed -i -e 's/$/ contrib non-free/g' /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -f -y --no-install-recommends \
	unrar unzip wget \
	mono-complete && \
	apt-get clean && \
	mkdir /wg /data

RUN cd /wg && \
    wget http://www.webgrabplus.com/sites/default/files/download/SW/V1.1.1/WebGrabPlusV1.1.1LINUX.rar && \
    wget http://www.webgrabplus.com/sites/default/files/download/sw/V1.1.1/upgrade/patchexe_57.zip && \
    unrar x WebGrabPlusV1.1.1LINUX.rar && \
    unzip patchexe_57.zip && \
    mv WebGrab+Plus.exe WebGrab+PlusV1.1.1LINUX/exe/ && \
    mv xmltv.dll WebGrab+PlusV1.1.1LINUX/exe/ && \
    find . -mindepth 1 -maxdepth 1 -type f -delete

VOLUME /data

WORKDIR /data

CMD ["mono", "/wg/WebGrab+PlusV1.1.1LINUX/exe/WebGrab+Plus.exe", "/data"]
