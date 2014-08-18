class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :destroy]

  respond_to :html, :json

  def index
    @messages = Message.order(created_at: :desc)
  end

  def new
    @message = Message.new
    respond_with @message
  end

  def create
    @message = Message.create(message_params)
    respond_with @message, location: messages_path
  end

  def destroy
    @message.destroy
    respond_with @message
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:name, :body)
    end
end
