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
    erb :name
  end

  get "/p1place" do
    erb :p1place
  end

  get "/p2place" do
    session[:game].player_1.place_ship Ship.aircraft_carrier, params[:coordinate].capitalize.to_sym, params[:rotation].to_sym 
    session[:game].player_1.place_ship Ship.battleship, params[:coordinate2].capitalize.to_sym, params[:rotation2].to_sym
    erb :p2place
  end

  get '/coordinate' do
    session[:game].player_2.place_ship Ship.aircraft_carrier, params[:coordinate].capitalize.to_sym, params[:rotation].to_sym 
    session[:game].player_2.place_ship Ship.battleship, params[:coordinate2].capitalize.to_sym, params[:rotation2].to_sym
    erb :coordinate
  end

  post "/coordinate" do 
    @hit = session[:game].player_2.shoot params[:coordinate2].capitalize.to_sym 
    erb :coordinate
  end

  get '/coordinate2' do
    erb :coordinate2
  end

  post "/coordinate2" do
    @hit2 = session[:game].player_1.shoot params[:coordinate].capitalize.to_sym
    erb :coordinate2
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
