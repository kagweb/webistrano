# Webistrano - Capistrano deployment the easy way

## About:
  Webistrano is a Web UI for managing Capistrano deployments. It lets you
  manage projects and their stages like test, production, and staging with
  different settings. Those stages can then be deployed with Capistrano
  through Webistrano.

## Preliminaries:

### 1. Instrall heroku gem
  Install heroku gem:

    gem install heroku

### 2. User registration
  Register on heroku.com (without going into detail).


## Deploy on Heroku:

### 1. Configuration
  Copy `config/webistrano_config.rb.sample` to `config/webistrano_config.rb`
  and edit appropriatly. In this configuration file you can set the mail
  settings of Webistrano.

### 2. Create heroku application
  Create heroku application by your favorite app-name:

    cd webistrano
    heroku login
    heroku create --stack cedar app-name

### 3. Bundle install
  Install gems:

    rm Gemfile.lock 
    bundle install --without production

### 4. Precompile on local
  Precompile on local:

    RAILS_ENV=production bundle exec rake assets:precompile

### 5. Deploy on heroku
  Deploy on heroku:

    git push heroku master

### 6. Create the database
  Create the database structure with Rake on heroku:

    heroku run rake db:migrate
    heroku run rake db:seed

### 7. Start Webistrano
  Webistrano is then available at http://app-name.herokuapp.com/

  The default user is `admin`, the password is `admin!`. Please change the
  password after the first login.

## Author:
  Ichiro Kimura <kag.web@gmail.com>
  
## License: 
  Code: BSD, see LICENSE.txt
  Images: Right to use in their provided form in Webistrano installations. No other right granted.
