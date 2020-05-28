## 開発環境構築
### ツール
- Docker, docker-compose, nodejs, yarn

### アプリケーションの構築
Rails, Nuxtをそれぞれ別のターミナルで起動する

#### Rails
```
cd rails

# 初回
make build

# railsを起動
make serve
```

#### Nuxt.js
```
cd nuxt

# 初回
cp .env.sample .env
yarn install

# nuxt を起動
yarn dev
```

http://localhost:3000 にアクセスする