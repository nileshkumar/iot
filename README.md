# README

* Ruby version : ruby 3.1.2p20

* Rails vrsion : Rails 7.0.4

* Application setup: 

- git clone git@github.com:nileshkumar/iot.git
- bundle install
- rails db:setup

* Database : Postgresql

* Database initialization

* How to run the test suite : bundle exec rspec

* end-points

SITES RESOURCE

- GET    /api/v1/sites
- POST   /api/v1/sites 
- PUT    /api/v1/sites/:id
- DELETE /api/v1/sites/:id


DEVICE RESOURCE

- GET    /api/v1/sites/:site_id/devices
- POST   /api/v1/sites/:site_id/devices
- PUT    /api/v1/sites/:site_id/devices/:id
- DELETE /api/v1/sites/:site_id/devices/:id