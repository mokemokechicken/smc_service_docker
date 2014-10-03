About
======

A Project for building Docker container of StateMachineGenerator.



Requirement
======

* Docker (tested on version 1.2.0)


Build
----------

```
make build
```

Run
-------

```sh
docker run -d -p 8000:8000 -p 9000:9000 -p 10022:22 -v /full/path/to/sqlitedb/dir/on/docker/host:/application/GoodParts/mnt mokemokechicken/smc_service
```

Access
-------

### HTTP

```
http://<docker_host>:8000/
```

### Login to Server

```sh
ssh -p 10022 root@<docker_host>
(password is 'rootroot')
```
