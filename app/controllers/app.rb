class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}
  set :public_folder, Proc.new { File.join(root, '../../public')}

  get '/' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do
  @song = Song.find(params[:id])
  erb :"songs/edit"
  end

  post '/songs/:id' do
    @song = Song.find(params[:id])
    request = Rack::Request.new(env)
    @song.title = request.params["song"]["title"]
    @song.artist = request.params["song"]["artist"]
    @song.album = request.params["song"]["album"]
    @song.genre = request.params["song"]["genre"]
    @song.length = request.params["song"]["length"]
    erb :'songs/show'
  end

end
