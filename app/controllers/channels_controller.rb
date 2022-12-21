class ChannelsController < ApplicationController
  include ChannelsHelper
  before_action :set_channel, only: [:edit, :update, :destroy]

  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new
  end

  def edit; end

  def create
    @channel = Channel.new(check_params)
    if @channel.save
      redirect_to(channels_url, notice: 'Channel was successfully created.')
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @channel.update(check_params)
      redirect_to(channels_url, notice: 'Channel was successfully updated.')
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @channel.destroy
    redirect_to(channels_url, notice: 'Channel was successfully destroyed.')
  end

  private

  def set_channel
    @channel = Channel.find(params[:id])
  end

  def channel_params
    params.require(:channel).permit(:title, :url)
  end

  def check_params(params = channel_params)
    response = something_url(params['url'])
    params['url'] = response
    params
  end
end
