# postgis-rails-3.2-experiments

This is a Rails 3.2.x proof-of-concept application.

Its purpose is to demonstrate how to use the PostGIS extensions for Postgresql through a simple example of business locations.

*Most of this guide was sourced from the [activerecord-postgis-adapter guide process](https://github.com/rgeo/activerecord-postgis-adapter/blob/2.0-stable/README.md)*


## Setup

Using the PostGIS extension requires a little extra work.  But it's not difficult.


### Database & Rails Configuration

Add to the `Gemfile`
```ruby
gem 'activerecord-postgis-adapter'
```

Change the adapter setting on `database.yml`
```ruby
development: &postgres
  adapter: postgis
  database: postgis-ft-dev
  host: localhost
  port: 5432
  pool: 25
  timeout: 5000
```

Run the following `rake` task to enable the PostGIS extension in the database
```bash
rake db:gis:setup
```

## Create Spatial Tables

