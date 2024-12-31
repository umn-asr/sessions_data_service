source "https://artifactory.umn.edu/artifactory/api/gems/asr-rubygems"
ruby "3.2.2"

gem "rails", "~> 7.1.0"

gem "ruby-oci8", "~> 2.2"
gem "activerecord-oracle-adapter", "~> 7.1.0"
gem "bootsnap"

gem "rabl", "~> 0.16"
gem "oj", "~> 2.18.0"
gem "query_string_search", "~> 0.0.7"
gem "rack-cors", "~> 1.1.1", require: "rack/cors"
gem "lograge"
gem "logstash-event"
gem "loofah", "~>2.23"
gem "puma", "~> 5.2"

group :development, :test do
  gem "lastpassify"
  gem "listen"
  gem "spring", "~> 1.3.6"
  gem "oracle_cleaner"
  gem "rspec-rails", "~> 6.0"
end

group :development do
  gem "brakeman"
  gem "bundler-audit"
  gem "reek", "~> 6.1"
  gem "rubocop-ast", "~> 1.30"
  gem "standard"
end
