module Blogster
  class DirectoryParser
    attr_reader :sub_directories,
                :user_pages

    def initialize(sub_directories)
      @sub_directories = sub_directories
      # %w[/_about, _posts, styles,]
      # %w[/_about/]

      @user_pages = parse_user_pages
    end

    private

    def parse_user_pages
      sub_directories
        .select { |dir| dir =~ /^_[a-zA-Z]*$/ }
        .map { |dir| dir.gsub('_', '') }
    end
    # _about
    # _posts
    # styles
  end
end
