require 'rails_helper'

RSpec.describe('news/index', type: :view) do
  before do
    create(:news)
  end

  it 'shows the right content' do
    visit news_index_path
    expect(page).to(have_content('RSS news'))
    expect(page).to(have_content('MyNews'))
  end

  describe 'click links on page' do
    it 'click link Add channel' do
      visit news_index_path
      click_link('Add Channel')
      expect(page).to(have_content('New channel'))
    end

    it 'click link News title' do
      visit news_index_path
      click_link('MyNews')
      expect(page).to(have_content('Lorem Ipsum is simply dummy text of the printing and typesetting industry'))
      click_link('Back')
      expect(page).to(have_content('RSS news'))
    end
  end
end
