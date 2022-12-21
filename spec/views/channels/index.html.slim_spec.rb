require 'rails_helper'

RSpec.describe('channel/index', type: :view) do
  before do
    create(:channel)
  end

  it 'shows the right content' do
    visit channels_path
    expect(page).to(have_content('RSS channels'))
    expect(page).to(have_content('Drive.ru'))
  end

  describe 'click links on page' do
    it 'click link Add channel' do
      visit channels_path
      click_link('Add Channel')
      expect(page).to(have_content('New channel'))
    end

    it 'click link edit' do
      visit channels_path
      find('.btn-style-edit').click
      expect(page).to(have_content('Editing channel'))
      find('.btn-success').click
      expect(page).to(have_content('RSS channels'))
    end
  end
end
