NAME = selboo-pkgconfig
VERSION = 0.29
RELEASE = 1
HARDWARE = $(shell uname -m)
PWD = $(shell pwd)
IMAGE7 = selboo/rpmbuild:centos7
IMAGE8 = selboo/rpmbuild:rocky8
NEXUS = https://nexus3.corp.youdao.com
TAG = $(shell date +%Y%m%d-%H%M%S)

release7:
	docker pull ${IMAGE7}
	docker run -it --rm \
		-v ${PWD}/:/build/:rw \
		${IMAGE7} /bin/bash /build/build.sh ${VERSION} ${RELEASE}

debug7:
	docker run -it --rm \
		-v ${PWD}/:/build/:rw \
		${IMAGE7} /bin/bash

push7:
	curl -v --user 'admin:Uuq7lt2i' --upload-file \
		${NAME}-${VERSION}-${RELEASE}.el7.x86_64.rpm \
		${NEXUS}/repository/youdao-7/${NAME}-${VERSION}-${RELEASE}.el7.x86_64.rpm


release8:
	#docker pull ${IMAGE8}
	docker run -it --rm \
		-v ${PWD}/:/build/:rw \
		${IMAGE8} /bin/bash /build/build.sh ${VERSION} ${RELEASE}

debug8:
	docker run -it --rm \
		-v ${PWD}/:/build/:rw \
		${IMAGE8} /bin/bash

push8:
	curl -v --user 'admin:Uuq7lt2i' --upload-file \
		${NAME}-${VERSION}-${RELEASE}.el8.x86_64.rpm \
		${NEXUS}/repository/youdao-8/${NAME}-${VERSION}-${RELEASE}.el8.x86_64.rpm

