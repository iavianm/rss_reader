# README

# RSS News Reader Application

* Ruby version 3.0.2
* Rails version 6.1.7
* PostgreSQL
* Docker
* * *
* Start project

1. docker build -t rss_reader .
2. docker run -it -v [absolute path to the project ]:/rss_reader rss_reader bash
3. #gem install rails -v 6.1.7
4. #gem install pg
5. docker-compose build
6. docker-compose run --rm web bash -c "bundle install"
7. docker-compose run --rm web bash -c "rails db:create db:migrate"
8. docker-compose up
