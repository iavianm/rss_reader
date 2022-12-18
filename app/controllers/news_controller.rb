class NewsController < ApplicationController
  include NewsHelper
  before_action :set_news, only: [:show]

  def index
    @channels = Channel.all
    get_news
    @news = News.paginate(page: params[:page], per_page: 20).order(pubdate: :desc)
  end

  def show
    @news.looked = true
    @news.save
  end

  private

  def set_news
    @news = News.find(params[:id])
  end
end
