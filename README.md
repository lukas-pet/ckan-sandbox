
```shell
uv venv
source .venv/bin/activate
```

```shell
ckan generate config ./ckan_server/default/ckan.ini
```

Change these in a `ckan.ini`:
 - **sqlalchemy.url**: `postgresql://ckan_default:<POSTGRES_PASSWORD>@postgres/ckan_default?sslmode=disable`
 - **ckan.site_id**