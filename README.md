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
  pool: 5
  timeout: 5000
  schema_search_path: public
```

Create the current database and enable the PostGIS extension
```bash
$ rake db:create
$ psql -c 'CREATE EXTENSION IF NOT EXISTS postgis;' -d postgis-ft-dev
$ psql -c 'CREATE EXTENSION IF NOT EXISTS postgis;' -d postgis-ft-test
```

## Generate Model for Business

Use the Rails generators to create the basics
```bash
$ rails g scaffold Business name:string latlong:point
```

Edit the new migration to add additional constraints and an index
```ruby
class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.point :latlon, geographic: true

      t.timestamps
    end
    add_index :businesses, :latlon, using: :gist
  end
end
```

Migrate the database and load seed data
```bash
$ rake db:migrate
$ rake db:seed
```

## More reading

[Daniel Azuma's 9-part tutorial on working with geospatial operations in Rails](http://daniel-azuma.com/articles/georails)