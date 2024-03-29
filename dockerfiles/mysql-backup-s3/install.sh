#! /bin/sh

# exit if a command fails
set -e


apk update

# install mysqldump
apk add mysql-client

# install s3 tools
apk add  python3   py-pip
pip install six
pip install awscli


# install go-cron
apk add curl
curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron
apk del curl


# cleanup
rm -rf /var/cache/apk/*

