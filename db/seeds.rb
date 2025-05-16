Message.destroy_all
ChatUser.destroy_all  # si existe esta tabla intermedia
Chat.destroy_all
User.destroy_all

# Crear usuarios
user1 = User.create!(first_name: "Mateo", last_name: "Ramos", email: "mateo@example.com")
user2 = User.create!(first_name: "Camila", last_name: "Valle", email: "camila@example.com")
user3 = User.create!(first_name: "Diego", last_name: "Lopez", email: "diego@example.com")

# Crear chats
chat1 = Chat.create!(sender: user1, receiver: user2)
chat2 = Chat.create!(sender: user2, receiver: user3)

# Crear mensajes
Message.create!(user: user1, chat: chat1, body: "Hola Camila, ¿cómo estás?")
Message.create!(user: user2, chat: chat1, body: "Hola Mateo, todo bien :)")
Message.create!(user: user2, chat: chat2, body: "Hola Diego")
Message.create!(user: user3, chat: chat2, body: "Hola Camila")
