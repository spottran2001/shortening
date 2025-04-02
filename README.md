### INFORMATION

- RUBY VERSION
  ruby 3.1.2p20

- BUNDLED WITH
  2.3.7

- RAILS VERSION
  7.0.6

- NODEJS VERSION
  18.20.2

- RBENV VERSION
  >= 1.2.0-70

- UBUNTU VERSION
  20.04

###HOW TO MANAGEMENT VERSION NODE USING NVM
1. Installation
```sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
```

2. Reopen Terminal

3. Install node 18.20.2
```sh
$ nvm install 18.20.2
$ nvm use 18.20.2
```

### HOW TO INSTALL RBENV AND RUBY

1. Installing Rbenv
refer: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04

2. Install ruby v3.1.2
```sh
rbenv install 3.1.2
```

3. Use ruby v3.1.2
**for local**
```sh
rbenv local 3.1.2
```

**for global**
```sh
rbenv global 3.1.2
```

### HOW TO RUN

1. BUNDLE
```sh
$ bundle
```

2. Create file .env
```sh
$ touch .env
```

3. Add config Database
```txt
DATABASE_USERNAME=''
DATABASE_PASSWORD=''
DATABASE_HOST='localhost'
DATABASE_PORT='3306'
```

5. Rails Start
```sh
$ rake db:create db:migrate
$ rails s
```

### Security Issue

```txt
  * Cross-Site Request Forgery (CSRF) ->  CSRF protection tokens -> refer: https://medium.com/rubyinside/a-deep-dive-into-csrf-protection-in-rails-19fa0a42c0ef

  * DoS/DDoS -> rate limiting

  * SQL Injection -> Use parameter queries

  * HTTPS -> config Secure Sockets Layer (SSL) -> refer: https://gorails.com/guides/free-ssl-with-rails-and-nginx-using-let-s-encrypt

  * ...
```

### Scalability

```txt
Performance:
  * Caching -> redis
  * Load Balancing
  * Sql index
  *...
```
