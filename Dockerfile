FROM debian:stretch

MAINTAINER krichy@nmdps.net

RUN sed -i -e 's/$/ contrib non-free/g' /etc/apt/sources.list && \
	apt-get update && apt-get upgrade -f -y && \
	apt-get install -f -y --no-install-recommends \
	curl \
	mono-complete && \
	apt-get clean && \
	mkdir /wg /data

RUN cd /wg && \
    curl -sL http://webgrabplus.com/sites/default/files/download/SW/V2.1.0/WebGrabPlus_V2.1_install.tar.gz | \
    tar xzf - --strip-components=1

WORKDIR /data

CMD ["mono", "/wg/bin/WebGrab+Plus.exe", "/data"]
