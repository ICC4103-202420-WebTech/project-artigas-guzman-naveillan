# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :read, Course

    if user.persisted?
      can :manage, Course, teacher_id: user.id
      can :manage, Lesson, course: { teacher_id: user.id }
      can :manage, Question, user_id: user.id
    end
  end
end