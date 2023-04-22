# HNSia's URL Shortener

This app allows you to shorten any url you provide it with, similar to [bit.ly](bit.ly) or [tinyurl.com](tinyurl.com)\
It also tracks the geolocation of visitors to the shortened link.

Things you may want to cover:

## Ruby version

3.2.2

## System dependencies

- Rails 7.0.4.3 - Web framework
- sqlite3 - lightweight database used in the project (might need to install this if running the app locally)
- Mechanize - Gem/library used to interact with websites and extract title
- Geocoder - Gem/library used to obtain geolocation of visitors of the link
- Docker (optional) - Only needed if you want to run locally using docker

## Configuration

No configuration needed as for now

## Database creation and initialization

Run `bin/rails db:create` to create the db\
Run `bin/rails db:migrate` to setup the db\
Run `bin/rails db:migrate RAILS_ENV=test` to setup the db for running tests

## How to run the test suite

Run `bin/rails test` to run unit tests and integration tests\
Run `bin/rails test:system` to run system/UI tests with an automated browser\
Run `bin/rails test:all` to run all tests

## Deployment instructions

Navigate to the project folder

```
cd url-shortener
```

### <ins>With docker</ins>

Run the following to get the server started

```
docker build -t url-shortener .
docker run -it --rm -p 3000:3000 url-shortener
```

To clean up the image from your system, run

```
docker rmi -f url-shortener
```

### <ins>Manually in local pc/system</ins>

1. Install Ruby, Rails and Sqlite3 on your system if you haven't. You can find the guides by googling the documentation on their main page.
2. Run the command below in the project directory to install the gems/dependencies.

```
bundle install
```

3. Run the commands in [Database creation and initialization](#database-creation-and-initialization) to setup the database
4. Run the command below to start the server locally.

```
bin/rails server
```
