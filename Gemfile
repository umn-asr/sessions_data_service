source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

group :production, :staging do
  gem 'ruby-oci8', '2.1.7'
  gem 'activerecord-oracle_enhanced-adapter', :git => 'https://github.com/rsim/oracle-enhanced.git', :branch => 'rails42'
end

gem 'rabl'
gem 'oj'

group :development, :test do
  gem 'spring'

  gem 'rspec', '~> 3.2'
  gem 'rspec-rails', '~> 3.2'
  gem 'sqlite3'
end

group :development do
  gem 'capistrano', '= 3.3.5'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1'
  gem 'capistrano-passenger'
end
