# A sample Gemfile
source "https://rubygems.org"

gem 'rake'
gem 'activesupport'
gem 'activerecord', '~> 4.2.0'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'
gem 'bigdecimal', '1.3.5' # new gem for deployment

gem 'puma'
gem 'tux'

gem 'pry' # inserted here for deployment

group :development, :test do
  # gem 'pry' ## moved up for deployment
  gem 'shotgun'
  gem 'sqlite3', '~> 1.3.6'
end

# added for deployment:
group :production do 
  gem 'rails_12factor'
  gem 'pg', '~> 0.20'
end