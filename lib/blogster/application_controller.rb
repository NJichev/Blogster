class ApplicationController < Sinatra::Base
  def self.inherited(subclass)
    Router.use(subclass)
    super
  end

  set :root, ENV['PWD']
  set :views, proc { File.join(root, 'layout') }

  enable :logging
end
