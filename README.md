# RandoMagic!

This application synchronizes card data with the magicthegathering.io API. Card printings are collated, and from there a card selected at random (regardless of specific printing).

## Getting Started in Development

This project assumes you are using Ruby version management such as rbenv or chruby.

The expected available Ruby version is: `2.3.1` (as defined in `.ruby-version` and `Gemfile`)

Install the system requirements below:

- `ruby 2` — (ideally, installed with rbenv)
- `postgres 9.3` — [Postgres.app](http://postgresapp.com) is highly recommended
- `jpeg`, `imagemagick`, and `wget` — Install these with `brew install`
- `rails`, `bundler`, and `rake` — Install these gems with `gem install`

This project is designed to be deployed to Heroku. If you plan to deploy to Heroku, you will need the Heroku toolbelt (uou can run the project locally without it).

- `heroku` and `foreman` binaries — Install the [Heroku toolbelt](https://toolbelt.heroku.com)


### Provisioning Heroku

If you would like to deploy this application to Heroku, follow these steps. Note that you need a Hobby Basic (paid) database given the volume of printed Magic: The Gathering cards is greater than the 10k rows available with the hobby-dev plan.

If your Heroku instance is not already created, you need to provision it. In your project folder, create the Git repo if you haven't already then create a new Heroku app and add the buildpacks:

```shell
$ git init
$ heroku apps:create <NAME>
$ heroku buildpacks:add --index 3 heroku/ruby
```

If you're not sure what add-ons to provision for a Heroku application, start with these. All of them are free.

```shell
$ heroku addons:create heroku-postgresql:hobby-basic
$ heroku pg:backups schedule --at '03:00 America/New_York' DATABASE_URL
```

### Local Environment

Make your local Postgres database:

```shell
$ createdb <NAME>
```

Now freeze your gem dependencies inside `vendor`. This will update `Gemfile.lock` for you.

```shell
$ bundle install --path ./vendor/bundle
```

### Configuring the Environment

Generate some random secret keys.

```shell
$ rake keys
```

Make a new file called `.env` in your project root and insert the following:

```makefile
RAILS_ENV=development
RACK_ENV=development
DATABASE_URL=postgres://localhost/NAME
WEB_CONCURRENCY=1
SECRET_KEY_BASE=
```

Then add key values with the following guidelines:

##### RAILS_ENV and RACK_ENV

These variables set the environment mode for the application on boot. They should both be set to `development` in development mode and `production` in production mode. (Rack has it's own environment mode separate from Rails.)

##### DATABASE_URL

This is a Postgres URI to your development database. It should be in the form `postgres://localhost/<DATABASE_NAME>`, such as `postgres://localhost/coexist`.

If you are not using Postgres.app, you might need to provide a user and password, so the URI will be in the form `postgres://<USERNAME>:<PASSWORD>@<HOST>:<PORT>/<DATABASE_NAME>`.

Heroku sets this value in production for you.

##### WEB_CONCURRENCY

The number of Puma workers to use. In `development` this is usually just `1`, but it production it's `3` or more.

##### SECRET_KEY_BASE

Should be a random string of at least 30 alphanumeric characters. Generate a good one with the `rake keys` command. Changing this key after it's set will rotate every cookie and session on the site. The value of each of these should be *different in production*.

### Load the Database Schema

Now that your database is specified you can load the database schema into it:

```shell
$ rake db:schema:load
```

### Boot

If everything went OK, you should be able to start the rails server with `foreman start`:

```text
rails server
10:36:38 web.1  | started with pid 1560
10:36:40 web.1  | Bullet is logging query suggestions
10:36:40 web.1  | Clearing caches if they exist
10:36:42 web.1  | Rails is running on 0.0.0.0:3000 ✔
```

[toolbelt]: https://toolbelt.heroku.com
[pgapp]: http://postgresapp.com
