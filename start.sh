#!/bin/sh

nginx &
export MINIO_BROWSER_REDIRECT_URL=${DOMAIN_URL}/ui && /home/minio server --certs-dir /home/certs --console-address :9001 --address :9000 /home/data
tail -f