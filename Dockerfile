FROM alpine:3.18.4


ENV MINIO_KMS_SECRET_KEY_FILE=kms_master_key \
    MINIO_UPDATE_MINISIGN_PUBKEY="RWTx5Zr1tiHQLwG9keckT0c45M3AGeHD6IvimQHpyRywVWGbP1aVSGav" \
    MINIO_CONFIG_ENV_FILE=config.env

RUN echo "https://mirrors.cloud.tencent.com/alpine/v3.18/main" > /etc/apk/repositories && \
    echo "https://mirrors.cloud.tencent.com/alpine/v3.18/community" >> /etc/apk/repositories

ENV WEB_PATH /home/
WORKDIR $WEB_PATH

RUN apk add --update --no-cache nginx
RUN mkdir -p /etc/nginx/http.d/
ADD ./default.conf /etc/nginx/http.d/
ADD ./start.sh ./

RUN wget https://dl.min.io/server/minio/release/linux-amd64/minio
RUN chmod +x minio
RUN mkdir /home/data && mkdir /home/certs && chmod -R 777 /home/data /home/certs

CMD ["sh", "start.sh"]