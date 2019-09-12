require 'sinatra/activerecord'
require 'require_all'
require 'tty-prompt'
require 'pry'

require_all 'lib'
prompt = TTY::Prompt.new



ActiveRecord::Base.establish_connection({
    adapter: 'sqlite3',
    database: 'db/denverrestaurants.db'
})
new_user = User.new
cli = Cli.new(new_user)
cli.start
