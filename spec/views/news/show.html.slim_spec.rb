require 'rails_helper'

RSpec.describe('news/show', type: :view) do
  before do
    create(:news)
  end

  it 'shows the right content' do
    visit news_path(News.last)
    expect(page).to(have_content('MyNews'))
    expect(page).to(have_content('Lorem Ipsum is simply dummy text of the printing and typesetting industry'))
  end
end
