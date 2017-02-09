module Blogster
  class Templates
    attr_reader :templates

    def initialize(templates = {})
      @templates = templates
    end

    def each(page, &block)
      templates[page].each(&block)
    end

    def [](page)
      templates[page]
    end

    def []=(page, page_templates = [])
      templates[page] = page_templates
    end

    def pages
      templates.keys
    end
  end

  class Template
    attr_reader :path

    def initialize(path, name)
      @path = path
      @name = name
    end

    def file
      File.read(fullpath)
    end

    def fullpath
      File.join(path, @name)
    end

    def name
      @suffixless_name ||= @name.delete('.md')
    end

    def ==(other)
      name == other.name &&
        path == other.path
    end
  end
end
