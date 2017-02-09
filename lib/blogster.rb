require 'sinatra/base'
require 'rdiscount'
require 'slim'

require_relative 'blogster/version'
require_relative 'blogster/templates'
require_relative 'blogster/templates_parser'
require_relative 'blogster/router'
require_relative 'blogster/application_controller'

module Blogster
  class << self
    attr_reader :templates

    def create(templates)
      @templates = templates
      pages.each { |page| create_page(page) && create_page_templates(page) }
    end

    def pages
      @pages ||= @templates.pages
    end

    def create_page(page)
      Class.new(controller) do
        get "/#{page}" do
        end
      end
    end

    def create_page_templates(page)
      templates.each(page) do |template|
        Class.new(controller) do
          get "/#{page}/#{template.name}" do
            slim :layout do
              markdown template.file, layout: false
            end
          end
        end
      end
    end

    def run!
      Router.run!
    end

    private

    def controller
      ApplicationController
    end
  end
end
