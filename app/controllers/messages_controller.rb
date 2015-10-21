class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :destroy, :edit, :update]

  respond_to :html, :json

  def index
    @messages = Message.order(created_at: :desc)
  end

  def new
    @message = Message.new
    respond_modal_with @message
  end

  def create
    @message = Message.create(message_params)
    respond_modal_with @message, location: messages_path
  end

  def destroy
    @message.destroy
    respond_with @message
  end

  def edit
    respond_modal_with @message
  end

  def update
    flash[:notice] = "Message udated" if @message.update(message_params)
    respond_modal_with @message, location: messages_path
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:name, :body)
    end
end
