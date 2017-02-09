require 'spec_helper'

describe Blogster::TemplatesParser do
  it 'can get the page from directory name' do
    page = template_parser.get_page_from_dir '/home/me/blog/_about/'
    expect(page).to eq 'about'
  end

  it 'can parse template paths' do
    path, name = template_parser.parse_template_path('/home/me/blog/_about/me.md')
    expect(path).to eq '/home/me/blog/_about'
    expect(name).to eq 'me.md'
  end
end

def template_parser(dirs = [])
  Blogster::TemplatesParser.new(dirs)
end
