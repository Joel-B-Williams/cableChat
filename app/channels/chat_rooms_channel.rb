class ChatRoomsChannel < ApplicationCable::ChatRoomsChannel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed 
    #any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    #process data sent from the page
    #creates a message assigned to the user, (I think) called by rooms.coffee send_message method.  Ultimatly message is pulled from the text area value, and chat room id is pulled from data-chat-room-id html attribute
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
  end
end