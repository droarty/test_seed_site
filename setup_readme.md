Setting up new repo
- for postgres setup I used these steps:
  - https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos
  - and this https://yizeng.me/2015/02/09/install-and-setup-postgresql-for-ruby-on-rails-on-mac-os/
- for generic rails setup I used these steps
  - https://guides.rubyonrails.org/getting_started.html
- for omniauth setup I used this resource:
  - https://medium.com/@amoschoo/google-oauth-for-ruby-on-rails-129ce7196f35
- for dotenv stuff
  - install dotenv https://www.freecodecamp.org/news/heres-how-you-can-actually-use-node-environment-variables-8fdf98f53a0a/
  - and add gem "dotenv-rails"
- for google analytics
  - https://analytics.google.com/analytics/web/provision/?authuser=6#/report-home/a170115764w236808146p221642529

Things to edit on a new site:
  - create a new pg db
    - add new schema to config/database.yml
  - oauth
    - create a new google app: https://medium.com/@amoschoo/google-oauth-for-ruby-on-rails-129ce7196f35
    - edit .env with new site id and secret
  - analytics
    - create a new analytics site: https://analytics.google.com/analytics/web/?authuser=6#/report-home/a170115764w236808146p221642529
    - edit application.html.erb template
      - add global site library to header
      - add tag manager library to the header
      - and add tag manager script to the body

Switching from mysql to pg
-  get the path to the pg_config file
  - sudo find / -name "pg_config"
- install the gem
  - gem install pg -- --with-pg-config=/usr/local/Cellar/postgresql/12.3_4/bin/pg_config
  - replace sqllite gem with pg gem
  - rake db:migrate
