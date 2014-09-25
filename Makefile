IMG=mokemokechicken/smc_service
repack_tag=repack

show:
	echo $(IMG)

build:
	docker build -t $(IMG) .

rebuild:
	docker build --no-cache -t $(IMG) .

delete:
	docker rmi $(IMG)

bash:
	docker run -i -t $(IMG) /bin/bash --login

push:
	docker push $(IMG)

repack:
	time docker export `docker run -d $(IMG) echo` > image.tar
	time docker import - $(IMG):$(repack_tag) < image.tar
	rm -f image.tar

