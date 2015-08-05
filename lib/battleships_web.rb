require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  enable :sessions

  get '/' do
    erb :index
  end

  get '/new_game' do
    @visitor1 = params[:name]
    @visitor2 = params[:name2]
    session[:game] = Game.new Player, Board
    session[:game].player_2.place_ship Ship.destroyer, :E4
    session[:game].player_1.place_ship Ship.destroyer, :E4
    erb :index1
  end

  get '/coordinate' do
    @coordinate = params[:coordinate]
    erb :index2
  end

  get '/coordinate2' do
    @coordinate2 = params[:coordinate2]
    erb :index3
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
