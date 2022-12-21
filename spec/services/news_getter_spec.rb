require 'rails_helper'

RSpec.describe(NewsGetter) do
  before do
    @channel = create(:channel)
  end

  it 'Get news' do
    NewsGetter.(url: @channel.url, id: @channel.id)

    expect(News.all.length).to(be > 0)
    expect(News.all).to_not(eq([]))
  end
end
