#!/bin/sh

BASE_PASTH=$(pwd)
FILE_NAME=$(date +%Y%m%d%H%M)

zip -r w7_minio_${FILE_NAME}.zip ./Dockerfile ./start.sh default.conf