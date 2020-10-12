FROM debian:buster
MAINTAINER Marc Odley <marc@naked-digital.co.uk>

RUN apt-get update && apt-get install -y varnish nano && apt-get clean
ADD ./start.sh /start.sh
RUN chmod +x /start.sh

ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV CACHE_SIZE      1024M
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600 -p thread_pool_stack=96K -T 0.0.0.0:6082 -S /etc/varnish/secret

EXPOSE 80 6082

CMD /start.sh
