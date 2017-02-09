# This is the base controller of our application.
# It will mount the dynamically created controllers
# in our app.
# This is achieved with inheritance callback.
class Router < Sinatra::Base
  set :root, ENV['PWD']
  set :views, proc { File.join(root, 'layout') }

  set :port, 5000
  set :bind, '0.0.0.0'
end
