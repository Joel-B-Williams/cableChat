class MessageBroadcastJob < ApplicationJob 
  queue_as :default

  #this method does the actual broadcasting. 
  def perform(message)
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel", message: render_message(message)
  end

  private

    #renders _message partial with help from message controller (created just for this)
    def render_message(message)
      MessageController.render partial: 'mesages/message', locals: {message: message}
    end
end