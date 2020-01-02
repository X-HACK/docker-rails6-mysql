# rails6+mysql on Docker
Docker上にrails6+mysqlの開発環境を構築します。

## 構築手順
### このリポジトリをclone

```
git clone https://github.com/koki-h/docker-rails6-mysql.git
```

### webコンテナのビルド

```
$ ./setup.sh
```

### コンテナ群の起動

```
$ docker-compose up -d
```
ホスト側の `./apps` ディレクトリがコンテナの `/apps` ディレクトリにマウントされる

### webコンテナのコンソールにログイン

```
$ docker-compose exec web bash
```

### webコンテナのコンソールからrails new

```
% rails new newapp --database=mysql
```

### config/database.ymlの修正
```
% cd newapp
% vim config/database.yml
```

- config/database.yml
```
default: &default
adapter: mysql2
encoding: utf8
pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
username: root
password: password # docker-compose.ymlのMYSQL_ROOT_PASSWORD
host: db # docker-compose.ymlのservice名
```

### DB作成
```
% rails db:create
```

あとはコンソールにログインしてgenerateするなどして開発開始

### コンテナ群の停止
```
$ docker-compose stop
```
`docker-compose down` だと修正が最初のイメージに巻き戻ってしまう(rails newで入ったgemなどが消える)ので注意

