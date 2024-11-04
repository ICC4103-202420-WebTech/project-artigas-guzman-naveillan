# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # usuario invitado (no logueado)

    # Permitir a todos los usuarios leer cursos
    can :read, Course

    if user.persisted? # Si el usuario está logueado
      # Permitir al usuario gestionar (editar, actualizar, borrar) solo los cursos que ha creado
      can :manage, Course, teacher_id: user.id
    end
  end
end