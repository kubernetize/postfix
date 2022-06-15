FROM alpine:3.16

LABEL maintainer="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add gettext postfix postfix-mysql postfix-pgsql

COPY assets/ /

CMD ["/usr/local/sbin/postfix.sh"]
