FROM ghcr.io/kubernetize/alpine-service-base

LABEL org.opencontainers.image.authors="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add postfix postfix-mysql postfix-pgsql

COPY assets/ /

CMD ["/usr/libexec/postfix/master", "-i"]
