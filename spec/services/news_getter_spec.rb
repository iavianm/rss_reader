require 'rails_helper'

RSpec.describe(NewsGetter) do
  before do
    @channel = create(:channel)
  end

  it 'Get news with correct URL' do
    NewsGetter.(url: @channel.url, id: @channel.id)

    expect(News.all.length).to(be > 0)
    expect(News.all).to_not(eq([]))
  end

  it 'Get news with incorrect URL' do
    incorrect_channel = Channel.create(url: 'http://www.fakenews', title: 'fakenews')
    NewsGetter.(url: incorrect_channel.url, id: incorrect_channel.id)

    expect(News.all.length).to(eq(0))
    expect(News.all).to(eq([]))
  end
end
