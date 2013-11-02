# Cloud Server Manager

Cloud Server Manager is Rails 4.x application that can be used to manage servers in cloud providers.
These cloud providers can be AWS, Rackspace Cloud, HP Cloud, or any other provider that provides an
API to interact with its services.

This is a barebones app and needs to be tailored for specific needs.

## Installation

Use RVM or System Ruby 2.x or later.

`git clone https://github.com/raravena80/servermgr.git`

``` ruby
  gem install rails
  bundle install
```

## Getting Started

### 1. Configuration

  edit servermgr/config/database.yml

  (At this point mysql and sqlite have been tested but Postgresql can be used
  with the appropriate gem)

``` yaml
development:
  adapter: mysql2
  encoding: utf8
  database: servermgr_development
  pool: 5
  username: dbuser
  password: dbpassword
  host: dbhost

test:
  adapter: mysql2
  encoding: utf8
  database: servermgr_test
  pool: 5
  username: dbuser
  password: dbpassword
  host: dbhost

production:
  adapter: mysql2
  encoding: utf8
  database: servermgr_production
  pool: 5
  username: dbuser
  password: dbpassword
  host: dbhost

```

### 2. Setup
  This esentially creates and migrates all dbs: production, dev, and test.

``` bash
  rake db:create:all
  rake db:migrate:all
  rails g figaro:install
```

Next edit your config/application.yml file and fill in the following values
depending on your Google and Github accounts. This is for Oauth Authentication.

``` yaml
GITHUB_KEY: YourGihubKey
GITHUB_SECRET: YourGihubSecret
OMNIAUTH_PROVIDER_KEY: 184284043052.apps.googleusercontent.com
OMNIAUTH_PROVIDER_SECRET: YourGoogleAppsSecret

COMPANY_DOMAIN: YourCompanyDomain (i.e google.com)
# You can create more user roles here.
ROLES: [user, admin]
```


### 3. Development Environment Deployment

  Run: `rails s` and then
  point your browser to `http://localhost:3000`

### 4. Production Deployment

  There are multiple options for deploying code to a production environment.
  Some of the more popular options are running deployment using:

  - Capistrano, mod_passenger with Apache or Nginx
  - Capistrano with Unicorn and reverse proxy through Nginx

### 5. Testing

  More on this later...
