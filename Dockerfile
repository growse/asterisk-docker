FROM debian:bullseye-slim

# RUN apk add --update asterisk=18.2.2-r5
RUN apt-get update && apt-get install -y asterisk && rm -rf /var/lib/apt/lists/*

#RUN rm extensions.ael extensions.lua extensions_minivm.conf hep.conf res_parking.conf statsd.conf
RUN mv /etc/asterisk/ /etc/asterisk-old
RUN mkdir /etc/asterisk

RUN touch /etc/asterisk/pjproject.conf /etc/asterisk/ccss.conf /etc/asterisk/cel.conf /etc/asterisk/features.conf /etc/asterisk/acl.conf /etc/asterisk/cdr_custom.conf /etc/asterisk/pjsip_notify.conf /etc/asterisk/udptl.conf /etc/asterisk/stasis.conf

COPY asterisk.conf /etc/asterisk/asterisk.conf
COPY logger.conf /etc/asterisk/logger.conf
COPY modules.conf /etc/asterisk/modules.conf
COPY cdr.conf /etc/asterisk/cdr.conf
COPY manager.conf /etc/asterisk/manager.conf
COPY indications.conf /etc/asterisk/indications.conf

CMD [ "/usr/sbin/asterisk", "-fp" ]