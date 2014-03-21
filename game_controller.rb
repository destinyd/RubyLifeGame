require './user'
require './game'
require './event'
#require './event_core'
require './event_core/exam'
require './event_core/work'
require './event_core/fun'
require 'debugger'

@code = File.new('code.rb').read

User.module_eval(@code)
@user = User.new
@game = Game.new# is_print_attrs: true
@game.run_by(@user)
