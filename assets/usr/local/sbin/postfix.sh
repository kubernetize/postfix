#!/bin/sh

/usr/libexec/postfix/post-install meta_directory=/etc/postfix create-missing

exec /usr/libexec/postfix/master -i
