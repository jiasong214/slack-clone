# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
jia = User.create!(
  username: "jia",
  pwd: "1",
  email: "jiasong214@gmail.com",
  image: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
)

Channel.destroy_all
first_channel = Channel.create!(
  name: "first channel",
  description: "this is first channel in Jia's slack clone",
  private: 0,
  user_id: jia.id,
  user_list: '[1]'
)

second_channel = Channel.create!(
  name: "second channel",
  description: "this is second channel in Jia's slack clone",
  private: 0,
  user_id: jia.id,
  user_list: '[1]'
)

Chat.destroy_all
Chat.create!(
  msg: "Hello, slack-clone! this is jia's first message",
  user_id: jia.id,
  channel_id: first_channel.id
)
Chat.create!(
  msg: "Hello",
  user_id: jia.id,
  channel_id: first_channel.id
)
Chat.create!(
  msg: "Hellooooooo",
  user_id: jia.id,
  channel_id: second_channel.id
)