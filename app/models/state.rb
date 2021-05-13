class State < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '新品・未使用'},
    { id: 3, name: '未使用に近い'}
  ]
  include ActiveHash::Associations
  has_many :items
end

<div class='chat-room-form__field'>
      <div class='chat-room-form__field--left'>
        <label class='chat-room-form__label' for='chat_room_チャットメンバー'>チャットメンバー</label>
      </div>
      <div class='chat-room-form__field--right'>
        <select name="room[user_ids][]">
          <option value="">チャットするユーザーを選択してください</option>
          <% User.where.not(id: current_user.id).each do |user| %>
            <option value=<%= user.id %>><%= user.name %></option>
          <% end %>
        </select>
        <input name="room[user_ids][]" type="hidden" value=<%= current_user.id %>>
      </div>
    </div>