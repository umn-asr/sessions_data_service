source "https://artifactory.umn.edu/artifactory/api/gems/asr-rubygems"
ruby "3.2.2"

gem "rails", "~> 7.1"

gem "ruby-oci8", "~> 2.2"
gem "activerecord-oracle_enhanced-adapter"
gem "bootsnap"

gem "rabl", "~> 0.16"
gem "oj", "~> 2.18.0"
gem "query_string_search", "~> 0.0.7"
gem "rack-cors", "~> 1.1.1", require: "rack/cors"
gem "lograge"
gem "logstash-event"
gem "loofah"

group :development, :test do
  gem "lastpassify"
  gem "listen"
  gem "spring", "~> 1.3.6"
  gem "oracle_cleaner"
  gem "puma", "~> 5.2"
  gem "rspec-rails", "~> 6.0"
end

group :development do
  gem "brakeman"
  gem "bundler-audit"
  gem "capistrano", "~> 3.6.0"
  gem "capistrano-rails", "~> 1.2.0"
  gem "capistrano-bundler", "~> 1.2.0"
  gem "capistrano-logrotate", "0.4.0"
  gem "capistrano-passenger", "~> 0.2.0"
  gem "reek", "~> 6.1"
  gem "rubocop-ast", "~> 1.30"
  gem "standard"
end
