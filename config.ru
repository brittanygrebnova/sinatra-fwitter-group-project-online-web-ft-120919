require './config/environment'

# if ActiveRecord::Base.connection.migration_context.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

# designate collaborator, fork and clone, remote repo, locally create own branches - development
# then push, approve only other person's pull request

use Rack::MethodOverride
use TweetsController
use UsersController
run ApplicationController