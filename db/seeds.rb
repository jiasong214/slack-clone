# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
jia = User.create!(
  username: "jia",
  password: "123123",
  email: "jiasong214@gmail.com",
  title: "this is jia's title",
  image: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
)

nico = User.create!(
  username: "nico",
  password: "123123",
  email: "nico@gmail.com",
  image: "https://www.freecodecamp.org/news/content/images/2019/07/cover-photo.png"
)

mimi = User.create!(
  username: "mimi",
  password: "123123",
  email: "mimi@gmail.com",
  title: "the cutest cat in the world",
  image: "https://i.kym-cdn.com/entries/icons/original/000/026/638/cat.jpg"
)

Channel.destroy_all
first_channel = Channel.create!(
  name: "Jia's public channel",
  description: "this is Jia's public channel",
  private: 0,
  owner_id: jia.id
)

second_channel = Channel.create!(
  name: "Jia's private channel",
  description: "this is Jia's private channel",
  private: 1,
  owner_id: jia.id
)

Chat.destroy_all
Chat.create!(
  msg: "Hello, slack-clone! this is jia's first message",
  user_id: jia.id,
  channel_id: first_channel.id
)
Chat.create!(
  msg: "Hello, private channel",
  user_id: jia.id,
  channel_id: second_channel.id
)
Chat.create!(
  msg: "Hellooooooo",
  user_id: mimi.id,
  channel_id: second_channel.id
)

# jia is joined in both channels
jia.channels << first_channel << second_channel
nico.channels << first_channel
mimi.channels << second_channel