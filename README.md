
# postgres container

This stub used to create passwordless container for testing and development.

## How to execute linux or sql commands?

Note the folder structure.

- directory initdb.d/ contains shell script

  The .sh files in this directory executed in alphabetical order, after the postgres starts.
  You may edit the .sh file according to your needs, it may contain linux commands.

```
├── initdb.d
│   └── init-docker-db.sh
```
  It creates a user "docker" and a database "docker" and give full access to user. 

## How to connect to with psql client?

  The 5432 port is exposed to localhost, therefore you may simply connect as usual.

``` 
psql -h 127.0.0.1 -U docker -d docker
```

