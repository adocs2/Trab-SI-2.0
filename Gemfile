source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'

# Use PostgreSQL as the database for Active Record
gem 'pg'

# Nested Forms
gem 'cocoon'

# Geração de PDF
gem 'prawn'
gem 'prawn-table'

# Estatisticas
gem 'descriptive_statistics', '~> 2.4.0', :require => 'descriptive_statistics/safe'

# Usar SCSS no projeto
gem 'sass', '~> 3.4', '>= 3.4.21'
gem 'sass-rails', '~> 5.0'

# Framework CSS
gem 'materialize-sass'
# Usar Slim no projeto
gem 'slim', '~> 3.0', '>= 3.0.6'
gem 'slim-rails', '~> 3.0', '>= 3.0.1'

# Javascript, Json, JQuery e Coffee
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'json'

gem 'faker'

gem 'bcrypt', '~> 3.1.7'
gem 'uglifier', '>= 1.3.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug'
  gem 'rubocop', '~> 0.39.0', require: false
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'better_errors'
  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
end