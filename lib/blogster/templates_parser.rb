module Blogster
  class TemplatesParser
    attr_reader :dirs

    def initialize(dirs)
      @dirs = dirs
    end

    def to_templates
      dirs.each do |dir|
        page = get_page_from_dir(dir)
        templates[page] = folder_files(dir).map do |path|
          template_path, name = parse_template_path(path)
          new_template(template_path, name)
        end
      end
      templates
    end

    def templates
      @templates ||= Blogster::Templates.new
    end

    def new_template(template_path, name)
      Blogster::Template.new(template_path, name)
    end

    def get_page_from_dir(dir)
      dir.split('/').last.gsub('_', '')
    end

    def folder_files(dir)
      Dir[File.join(dir, '*')]
    end

    def parse_template_path(path)
      *template_path, name = path.split('/')
      template_path = File.join(*template_path)
      [template_path, name]
    end
  end
end
