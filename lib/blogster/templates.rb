module Blogster
  # Templates.new(templates)
  class Templates
   attr_reader :templates

    def initialize(templates)
      @templates = templates
    end
    #_about
    # { 'about' => [...templates]}
end
