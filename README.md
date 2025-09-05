
IMPORTANT - Create a Docker network(`ckan-network`) before running `docker compose up -d` or before creating dev containers.


We probably don't need virtualenvs when developing in containers, but for sake of simplicity let's leave it here.
```shell
uv venv
source .venv/bin/activate
```

```shell
uv sync
```

```shell
ckan generate config ./ckan_server/default/ckan.ini
```

Change these in a `ckan.ini`:
 - **sqlalchemy.url**: `postgresql://ckan_default:<POSTGRES_PASSWORD>@postgres/ckan_default?sslmode=disable`
 - **ckan.site_id**: I use `ckan_sandbox`, but you can name it anything
 - **ckan.redis.url**: `redis://redis:6379/0`
 - **solr_url** = `http://solr:8983/solr/ckan`

Initialize DB

```shell
ckan -c ./ckan_server/default/ckan.ini db init
```

Start the server

```shell
ckan -c ./ckan_server/default/ckan.ini run
```



## CKAN Architecture

![Architecture](https://docs.ckan.org/en/2.11/_images/architecture.png)

CKAN is based on Flask and built using Blueprints.

