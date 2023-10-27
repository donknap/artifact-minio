BASE_PASTH=$(shell pwd)
FILE_NAME=$(shell date +%Y%m%d%H%M)
VERSION=v1.0.0

docker: 
	docker build -t docker.wos.w7.com/w7/minio:${VERSION} .
	docker push docker.wos.w7.com/w7/minio:${VERSION}
publish: clean 
	zip -r w7_minio_${FILE_NAME}.zip ./Dockerfile ./start.sh default.conf
clean:
	rm -rf ./source*