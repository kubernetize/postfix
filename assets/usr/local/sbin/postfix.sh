#!/bin/sh

# Copy files listed in CONFIG_SOURCE_FILES from CONFIG_SOURCE_DIR to their destination
# If a source file not found, but one with suffix `.envsubst` is, then envsubst is used
# to substitute environment variables

for map in $CONFIG_SOURCE_FILES; do
	src="${map%%:*}"
	dst="${map#*:}"
	if [ -z "$src" -o -z "$dst" ]; then
		echo "[-] Invalid entry in CONFIG_SOURCE_FILES: $map"
		exit 1
	fi

	if [ -r "$CONFIG_SOURCE_DIR/$src" ]; then
		cp "$CONFIG_SOURCE_DIR/$src" "$dst"
	elif [ -r "$CONFIG_SOURCE_DIR/$src.envsubst" ]; then
		envsubst < "$CONFIG_SOURCE_DIR/$src.envsubst" > "$dst"
	else
		echo "[-] No source files found for $map"
		exit 2
	fi
done

unset CONFIG_SOURCE_DIR CONFIG_SOURCE_FILES

/usr/libexec/postfix/post-install meta_directory=/etc/postfix create-missing

exec /usr/libexec/postfix/master -i
