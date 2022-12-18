class NewsController < ApplicationController
  include NewsHelper
  before_action :set_news, only: [:show]

  def index
    get_news
    @news = News.paginate(page: params[:page], per_page: 20)
  end

  def show; end

  private

  def set_news
    @news = News.find(params[:id])
  end
end
