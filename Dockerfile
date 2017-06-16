FROM debian:stretch

MAINTAINER krichy@nmdps.net

RUN sed -i -e 's/$/ contrib non-free/g' /etc/apt/sources.list && \
	apt-get update && apt-get upgrade -f -y && \
	apt-get install -f -y --no-install-recommends \
	curl \
	mono-runtime libmono-system-data4.0-cil libmono-system-web4.0-cil && \
	apt-get clean && \
	mkdir /wg /data

RUN cd /wg && \
    curl http://www.webgrabplus.com/sites/default/files/download/SW/V2.0.7/WebGrabPlus_V2.0.7_beta_install.tar.gz | \
    tar xzf - --strip-components=1

VOLUME /data

WORKDIR /data

CMD ["mono", "/wg/bin/WebGrab+Plus.exe", "/data"]
