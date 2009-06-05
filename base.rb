# This is what I want to do in any rails app
run "echo TODO > README"

git :init
run "cp config/database.yml config/example_database.yml"

git :add => ".", :commit => "-m 'initial commit'"

# Here we add the exception logger so that no exception ever excapes us again
git :clone => 'git://github.com/defunkt/exception_logger.git vendor/plugins/exception_logger'
generate :exception_migration
rake "db:migrate"

file 'app/controllers/application_controller.rb', 
%q{class ApplicationController < ActionController::Base
 
  helper :all
 
  protect_from_forgery
 
  include ExceptionLoggable
  filter_parameter_logging :password, :password_confirmation
end
}

route "map.connect 'logged_exceptions/:action/:id', :controller => 'logged_exceptions'"
git :add => ".", :commit => "-m 'Added the exception logger'"