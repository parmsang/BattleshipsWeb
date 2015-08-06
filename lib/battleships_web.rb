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
    erb :index2
  end

  post "/coordinate" do 
    @hit = session[:game].player_1.shoot params[:coordinate].capitalize.to_sym 
    erb :index2
  end

  get '/coordinate2' do
    erb :index3
  end

  post "/coordinate2" do
    @hit2 = session[:game].player_2.shoot params[:coordinate2].capitalize.to_sym
    erb :index3
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
