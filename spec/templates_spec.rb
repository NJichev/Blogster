require 'spec_helper'

describe Blogster::Template do
  it 'can save path to templates' do
    path = '/home/terran/scv'
    name = 'build.md'

    template = t(path, name)
    expect(template.path).to eq path
    expect(template.fullpath).to eq File.join(path, name)
  end
end

describe Blogster::Templates do
  it 'can give us the pages' do
    expect(templates.pages).to eq %w(about starcraft)
  end

  it 'can give us the templates' do
    expect(templates['starcraft']).to match_array starcraft_templates
  end

  it 'can write templates' do
    posts = [t('/home/me/blog/_posts/', 'vim.md')]
    templates['posts'] = posts
    expect(templates['posts']).to match_array posts
  end

  it 'can iterate over the templates of a page' do
    template_names = []
    templates['starcraft'].each do |template|
      template_names << template.name
    end

    expect(template_names).to match_array %w(terran zerg protoss)
  end

  def templates
    templates_hash = {
      'about' => about_templates,
      'starcraft' => starcraft_templates
    }

    @templates ||= Blogster::Templates.new(templates_hash)
  end

  def about_templates
    [
      t('/home/me/blog/_about/', 'me.md'),
      t('/home/me/blog/_about/', 'introduction.md')
    ]
  end

  def starcraft_templates
    [
      t('/home/me/blog/_starcraft/', 'terran.md'),
      t('/home/me/blog/_starcraft/', 'zerg.md'),
      t('/home/me/blog/_starcraft/', 'protoss.md')
    ]
  end
end

def t(path, name)
  Blogster::Template.new(path, name)
end
