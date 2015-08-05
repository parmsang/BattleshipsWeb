require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  enable :sessions

  get '/' do
    erb :index
  end

  get '/new_game' do
    @visitor = params[:name]
    erb :index1
  end

  get '/coordinate' do
    @coordinate = params[:coordinate]
    session[:game] = Game.new Player, Board
    erb :index2
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
