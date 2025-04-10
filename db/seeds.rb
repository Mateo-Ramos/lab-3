# Crear usuarios de ejemplo
users = [
  { username: "mateo", email: "mateo@example.com" },
  { username: "camila", email: "camila@example.com" },
  { username: "pedro",  email: "pedro@example.com" }
]

users.each do |user_data|
  User.create!(user_data)
end

# Crear mensajes entre los usuarios
user1 = User.find_by(username: "mateo")
user2 = User.find_by(username: "camila")

chat = Chat.create!
chat.users << [ user1, user2 ]

Message.create!(
  chat: chat,
  user: user1,
  body: "Hola Camila, ¿cómo estás?"
)

Message.create!(
  chat: chat,
  user: user2,
  body: "¡Hola Mateo! Muy bien, ¿y tú?"
)
