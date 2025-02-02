class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, Project
      can :create, Project
      can [:edit, :update, :destroy], Project, user_id: user.id

      can :create, Comment
      can :destroy, Comment, user_id: user.id
    end
  end
end