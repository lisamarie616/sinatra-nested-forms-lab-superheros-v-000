require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :super_hero
  end

  post '/team' do
    @team = Team.new(params[:team])

    params[:team][:hero].each do |details|
      Superhero.new(details)
    end

    @superheroes = Superhero.all

    erb :team
  end

end
