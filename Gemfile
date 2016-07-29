source "https://rubygems.org"
ruby "2.3.1"

# Core
gem "rails", "~> 5.0.0"
gem "sprockets-rails", "~> 3.1"          # The Rails asset pipeline

# Commonly Used
gem "dotenv-rails"                       # Slurp in .env files during rake tasks and development
gem "pg"                                 # PostgreSQL adapter
gem "puma", "~> 3.0"                     # Puma web server

# Asset Pipeline
gem "autoprefixer-rails"                 # Autoprefixer for Sprockets/Rails
gem "sass-rails", require:false          # Don’t load sass-rails (but some gems depend on it)
gem "sassc-rails"                        # SassC (libsass) for Sprockets/Rails
gem "uglifier"                           # JavaScript minifier

# Project Specific
gem "mtg_sdk",  "~>3.0.0"                # SDK for working with the magicthegathering.io MTG API

# Development Only
group :development do
  gem "brakeman"                         # Audit the app for gems with CVEs and possibly insecure code
  gem "bullet"                           # Reporting on N+1 and unoptimized queries
  gem "byebug", platform: :mri           # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "listen"
end
