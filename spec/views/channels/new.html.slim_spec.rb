require 'rails_helper'

RSpec.describe('channel/new', type: :view) do
  it 'shows the right content' do
    visit new_channel_path
    expect(page).to(have_content('New channel'))
  end

  it 'click link Create channel with incorrect URL' do
    visit new_channel_path
    find('.form-title').set('Drive')
    find('.form-url').set('http://www.drive.ru')
    find('.btn-success').click
    expect(page).to(have_content('New channel'))
  end

  it 'click link Create channel with correct URL' do
    visit new_channel_path
    find('.form-title').set('Drive')
    find('.form-url').set('http://feeds.feedburner.com/drivenet')
    find('.btn-success').click
    expect(page).to(have_content('Drive'))
    expect(page).to(have_content('RSS channels'))
  end
end
