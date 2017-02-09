require 'sinatra/base'
require 'rdiscount'
require_relative 'blogster/version'
require_relative 'blogster/directory_parser'
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
      @pages ||= @templates.keys
    end

    def create_page(page)
      Class.new(controller) do
        get "/#{page}" do
        end
      end
    end

    def create_page_templates(page)
      templates[page].each do |template_path|
        template_name = parse_template_name(template_path)
        Class.new(controller) do
          get "/#{page}/#{template_name}" do
            markdown File.read(template_path)
          end
        end
      end
    end

    private

    def parse_template_name(template_path)
      template_path.split('/').last.gsub('.md', '')
    end

    def controller
      ApplicationController
    end
  end
end

templates = {
  'about' => %w[/home/njichev/test_dir/_about/me.md /home/njichev/test_dir/_about/introduction.md]
}

Blogster.create(templates)
Router.run!
