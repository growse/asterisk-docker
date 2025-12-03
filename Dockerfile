# syntax = docker/dockerfile:1
FROM alpine:3.23.0

RUN --mount=type=cache,target=/var/cache/apk apk add --update asterisk

RUN rm -rf /etc/asterisk/*
RUN touch /etc/asterisk/pjproject.conf /etc/asterisk/ccss.conf /etc/asterisk/cel.conf /etc/asterisk/features.conf /etc/asterisk/acl.conf /etc/asterisk/cdr_custom.conf /etc/asterisk/pjsip_notify.conf /etc/asterisk/udptl.conf /etc/asterisk/stasis.conf /etc/asterisk/pjsip.conf

COPY asterisk.conf /etc/asterisk/asterisk.conf
COPY logger.conf /etc/asterisk/logger.conf
COPY modules.conf /etc/asterisk/modules.conf
COPY cdr.conf /etc/asterisk/cdr.conf
COPY manager.conf /etc/asterisk/manager.conf
COPY indications.conf /etc/asterisk/indications.conf

USER 100

CMD [ "/usr/sbin/asterisk", "-fp", "-d" ]
