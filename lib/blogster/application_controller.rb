class ApplicationController < Sinatra::Base
  def self.inherited(subclass)
    Router.use(subclass)
    super
  end

  enable :logging
end
