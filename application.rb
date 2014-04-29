require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index, locals: { list_of_races: DB[:races].to_a }
  end

  get '/races/new' do
    erb :new
  end

  post '/races' do
    DB[:races].insert(race_name: params[:race_name], race_location: params[:race_location], race_month: params[:race_month])
    redirect '/'
  end
end