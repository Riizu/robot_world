class RobotWorldApp < Sinatra::Base
  get '/' do
    haml :home
  end

  get '/robots' do
    @robots = RobotManager.all
    haml :robots
  end

  get '/robots/new' do
    haml :new
  end

  get '/robots/:id' do |id|
    @robot = RobotManager.find(id.to_i)
    haml :show
  end

  get '/robots/:id/edit' do |id|
    @robot = RobotManager.find(id.to_i)
    haml :edit
  end

  post '/robots' do
    RobotManager.create(params[:robot])
    redirect '/robots'
  end

  put '/robots/:id' do |id|
    RobotManager.update(id.to_i, params[:robot])
    redirect '/robots/#{id}'
  end

  put '/robots/:id/generate_avatar' do |id|
    RobotManager.generate_new_avatar(id.to_i)
    redirect '/robots/#{id}/edit'
  end

  delete '/robots/:id' do |id|
    RobotManager.destroy(id.to_i)
    redirect '/robots'
  end
end
