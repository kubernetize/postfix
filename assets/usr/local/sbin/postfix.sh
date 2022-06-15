#!/bin/sh

for map in $DOCKER_ENVSUBST_FILES; do
	src="${map%%:*}"
	dst="${map#*:}"
	test -n "$src" -a -n "$dst" && envsubst < "$src" > "$dst"
done

unset DOCKER_ENVSUBST_FILES

/usr/libexec/postfix/post-install meta_directory=/etc/postfix create-missing

exec /usr/libexec/postfix/master -i
