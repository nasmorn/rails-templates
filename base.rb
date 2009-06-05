# This is what I want to do in any rails app
run "echo TODO > README"

gem 'exception_notification'
rake "gems:install"

git :init

run "cp config/database.yml config/example_database.yml"

git :add => ".", :commit => "-m 'initial commit"