require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/new_game' do
    @visitor = params[:name]
  #  game = Game.new Player, Board
  #  game.player_1.shoot :coordinate
    erb :index1
  end

  get '/coordinate' do
    @coordinate = params[:coordinate]
    # game = Game.new Player, Board
    # game.player_1.shoot :coordinate
    erb :index2
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
