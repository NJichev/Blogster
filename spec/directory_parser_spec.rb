require "spec_helper"

RSpec.describe do
  describe Blogster::DirectoryParser do
    it "takes only underscored directories" do
      sub_directories = %w[_foo _bar _baz qux quiz]
      pages = Blogster::DirectoryParser.new(sub_directories).user_pages

      expect(pages).to eq %w[foo bar baz]
    end

    it "doesn't parse hidden directories" do
      sub_directories = %w[_foo .bar .baz qux]
      pages = Blogster::DirectoryParser.new(sub_directories).user_pages

      expect(pages).to eq %w[foo]
    end
  end
end
