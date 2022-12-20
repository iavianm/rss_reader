require 'rails_helper'

RSpec.describe(Channel, type: :model) do
  it 'is valid with full params' do
    channel = Channel.create(
      title: 'MyNews',
      url: 'https://drive.ru',
    )

    expect(channel).to(be_valid)
  end

  it 'is invalid without title' do
    channel = Channel.create(
      url: 'https://drive.ru',
    )

    expect(channel).not_to(be_valid)
    expect(channel.errors[:title]).to(include("can't be blank"))
  end

  it 'is invalid without url' do
    channel = Channel.create(
      title: 'MyNews',
    )

    expect(channel).not_to(be_valid)
    expect(channel.errors[:url]).to(include("can't be blank"))
  end

  it 'is invalid with small title' do
    channel = Channel.create(
      title: 'My',
      url: 'https://drive.ru',
    )

    expect(channel).not_to(be_valid)
    expect(channel.errors[:title]).to(include('is too short (minimum is 3 characters)'))
  end

  it 'is invalid with incorrect url' do
    channel = Channel.create(
      title: 'MyChanal',
      url: 'drive.ru',
    )

    expect(channel).not_to(be_valid)
    expect(channel.errors[:url]).to(include('is invalid'))
  end

  it 'is invalid with not uniq url' do
    Channel.create(
      title: 'First',
      url: 'https://drive.ru',
    )

    second_channel = Channel.create(
      title: 'Second',
      url: 'https://drive.ru',
    )

    expect(second_channel).not_to(be_valid)
    expect(second_channel.errors[:url]).to(include('has already been taken'))
  end
end
