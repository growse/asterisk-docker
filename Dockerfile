FROM alpine:3.15

RUN apk add --update asterisk=18.2.2-r5

CMD [ "/usr/sbin/asterisk", "-fp" ]