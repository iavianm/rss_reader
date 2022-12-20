require 'rails_helper'

RSpec.describe(News, type: :model) do
  before do
    @channel = create(:channel)
  end

  it 'is valid with full params' do
    news = News.create(
      title: 'MyNews',
      link: 'https://drive.ru',
      author: 'MyAutor',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      pubdate: 1640894100,
      channel_id: @channel.id,
    )

    expect(news).to(be_valid)
  end

  it 'is invalid without title' do
    news = News.create(
      link: 'https://drive.ru',
      author: 'MyAutor',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      pubdate: 1640894100,
      channel_id: @channel.id,
    )

    expect(news).not_to(be_valid)
    expect(news.errors[:title]).to(include("can't be blank"))
  end

  it 'is invalid without link' do
    news = News.create(
      title: 'MyNews',
      author: 'MyAutor',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      pubdate: 1640894100,
      channel_id: @channel.id,
    )

    expect(news).not_to(be_valid)
    expect(news.errors[:link]).to(include("can't be blank"))
  end

  it 'is invalid without description' do
    news = News.create(
      title: 'MyNews',
      link: 'https://drive.ru',
      author: 'MyAutor',
      pubdate: 1640894100,
      channel_id: @channel.id,
    )

    expect(news).not_to(be_valid)
    expect(news.errors[:description]).to(include("can't be blank"))
  end

  it 'is invalid without pubdate' do
    news = News.create(
      title: 'MyNews',
      link: 'https://drive.ru',
      author: 'MyAutor',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      channel_id: @channel.id,
    )

    expect(news).not_to(be_valid)
    expect(news.errors[:pubdate]).to(include("can't be blank"))
  end

  it 'is invalid without channel' do
    news = News.create(
      title: 'MyNews',
      link: 'https://drive.ru',
      author: 'MyAutor',
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      pubdate: 1640894100,
    )

    expect(news).not_to(be_valid)
    expect(news.errors[:channel]).to(include("can't be blank"))
  end
end
