#HEROKU = (ENV.include?('ENV') && ENV['USER'].match(/^repo\d+/)) || ENV.include?('HEROKU_TYPE')

source 'http://rubygems.org'

gem 'mysql', '2.8.1'
gem 'rails', '3.0.0.beta4'
gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'devise', '1.1.rc2'
gem 'devise_invitable', :git => 'git://github.com/rymai/devise_invitable.git', :tag => 'v0.6.2'
gem 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git', :branch => 'rails3'
gem 'pacecar', '1.3.0'
gem 'simple-navigation', '2.7.1'
gem 'cancan', '1.3.2'
gem 'acts_as_reportable', '1.1.1', :require => 'ruport/acts_as_reportable'

# Heroku hack b/c we don't want use these gem on heroku env
#unless HEROKU
  group :test do
    gem 'redgreen', '1.2.2'
    gem 'rr', '0.10.9'
    gem 'factory_girl_rails'
    gem 'pickle'

    gem "rspec-rails", ">= 2.0.0.beta.17"
    gem 'cucumber', '0.8.5'
    gem 'cucumber-rails', '0.3.2'
    gem 'capybara', '0.3.8'
    gem 'autotest-rails', '4.1.0'
    gem 'autotest', '4.3.2'

    gem 'ruby-debug', '0.10.3'
  end
#end