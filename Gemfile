source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem "rack", ">= 2.0.6"
gem "loofah", ">= 2.2.3"
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'
gem 'sassc'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass'
gem 'slim'
gem 'font-awesome-rails'
gem 'pry'
gem 'better_errors'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'rails-i18n', '~> 5.0.0' # For 5.0.x and 5.1.x
gem 'kaminari'
# gem "pundit"
gem 'pundit', github: 'elabs/pundit'

gem 'simple_form'
gem "github_api"
gem 'tinymce-rails'

gem "rails-settings-cached"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'devise'

#turkish_support
gem 'turkish_support'
gem 'iconv'
gem 'htmlentities'

#image processing
gem "rmagick", "~> 2.13.1"
gem 'carrierwave'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
