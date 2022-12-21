require 'rails_helper'

RSpec.describe('channel/edit', type: :view) do
  before do
    create(:channel)
  end

  it 'shows the right content' do
    visit channels_path
    find('.btn-style-edit').click
    expect(page).to(have_content('Editing channel'))
  end

  it 'click link Editing channel with incorrect URL' do
    visit channels_path
    find('.btn-style-edit').click
    expect(page).to(have_content('Editing channel'))
    find('.form-title').set('Drive')
    find('.form-url').set('http://www.drive.ru')
    find('.btn-success').click
    expect(page).to(have_content('Editing channel'))
  end

  it 'click link Editing channel with correct URL' do
    visit channels_path
    find('.btn-style-edit').click
    expect(page).to(have_content('Editing channel'))
    find('.form-title').set('Drive')
    find('.form-url').set('http://feeds.feedburner.com/drivenet')
    find('.btn-success').click
    expect(page).to(have_content('Drive'))
    expect(page).to(have_content('RSS channels'))
  end
end
