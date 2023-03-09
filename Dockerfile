FROM ghcr.io/kubernetize/alpine-service-base:3.17.2

LABEL org.opencontainers.image.authors="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add postfix postfix-mysql postfix-pgsql

COPY assets/ /

CMD ["/usr/local/sbin/postfix.sh"]
