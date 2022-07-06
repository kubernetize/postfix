FROM ghcr.io/kubernetize/alpine-service-base

LABEL maintainer="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add postfix postfix-mysql postfix-pgsql

COPY assets/ /

CMD ["/usr/local/sbin/postfix.sh"]
