How To Use
==========

```
# database file is only in the container.
docker run -d -p 8000:8000 -p 9000:9000 -p 10022:22 mokemokechicken/smc_service

or

# database file is exported at /db/production.sqlite3 on the host machine.
docker run -d -p 8000:8000 -p 9000:9000 -p 10022:22 -v /db:/application/GoodParts/mnt mokemokechicken/smc_service
```
