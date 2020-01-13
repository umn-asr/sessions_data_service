source 'https://artifactory.umn.edu/artifactory/api/gems/asr-rubygems'
ruby "2.4.1"

gem 'rails', '4.2.11.1'

gem 'ruby-oci8', '~> 2.2.1'
gem 'activerecord-oracle_enhanced-adapter', '~> 1.6'

gem 'rabl', '~> 0.11.6'
gem 'oj', '~> 2.18.0'
gem 'query_string_search', '~> 0.0.7'
gem 'rack-cors', '~> 1.0.6', :require => 'rack/cors'
gem 'lograge'
gem 'logstash-event'

group :development, :test do
  gem "lastpassify"
  gem 'spring', '~> 1.3.6'
  gem 'oracle_cleaner'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'capistrano', '~> 3.6.0'
  gem 'capistrano-rails', '~> 1.2.0'
  gem 'capistrano-bundler', '~> 1.2.0'
  gem "capistrano-logrotate", "0.4.0"
  gem 'capistrano-passenger', '~> 0.2.0'
end
