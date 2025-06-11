class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    # Mensajes: solo puede ver, crear y editar sus propios
    can [ :read, :create, :update ], Message, user_id: user.id

    # Chats: puede ver, crear y editar chats en los que participa
    can [ :read, :create, :update ], Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end

    # Usuarios: puede ver su propia info
    can :read, User, id: user.id
  end
end
