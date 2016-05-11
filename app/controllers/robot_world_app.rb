class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path('..', __dir__)

  get '/' do
    haml :index
  end
end
