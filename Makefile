IMG=mokemokechicken/smc_service
repack_tag=repack

show:
	echo $(IMG)

build:
	docker build -t $(IMG) .

rebuild:
	docker build --no-cache -t $(IMG) .

recommit:
	docker build -t $(IMG) - < ReDockerfile

delete:
	docker rmi $(IMG)

bash:
	docker run -i -t $(IMG) /bin/bash --login

push:
	docker push $(IMG)

run:
	docker run -d -p 8000:8000 -p 9000:9000 -p 10022:22 -v /var/lib/smc:/application/GoodParts/mnt $(IMG)

repack:
	time docker export `docker run -d $(IMG) echo` > image.tar
	time docker import - $(IMG):$(repack_tag) < image.tar
	rm -f image.tar

