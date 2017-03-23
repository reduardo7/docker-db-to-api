# DB to API

## docker-compose

```yml
version: "2"

services:

  app:
    image: reduardo7/db-to-api
    environment:
      DB_HOST: "db-host"
      DB_USER: "root"
      DB_PASS: "root"
      DB_DATABASE: "app"
    links:
      - db:db-host

  db:
    image: mysql
    hostname: db
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_DATABASE=app
      #- "13306:3306"
    volumes:
      - ./.data/db:/var/lib/mysql
      #- ./db:/docker-entrypoint-initdb.d
```

## Start

### Build APP

(Only once)

```bash
docker-compose up builder
```

### Run APP

```bash
docker-compose up app
```

#### Background

```bash
docker-compose up -d app
```

### Run phpMyAdmin

```bash
docker-compose up db-admin
```

#### Background

```bash
docker-compose up -d db-admin
```

## Stop all

```bash
docker-compose down
```

## Reset DB

```bash
docker-compose down
sudo rm -rf .data/db
```

## Doc

* https://www.npmjs.com/package/mysql-to-rest

## Examples

### List

```bash
curl -X GET "http://localhost:3000/api/product"
```

### Save

```bash
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d 'description=Test 2&code=987654321' "http://localhost:3000/api/product"
```
