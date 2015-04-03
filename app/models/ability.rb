class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)


    # everyone
    can :read, Comment
    can :read, User


    # admin
    if user.admin?
      can :manage, :all
    end

    if user.id.nil?
      # not logged in users

      # only first two levels of leaves
      can :read, Leaf

      can :read, Forest
    else
      # Logged in users
      
      can :create, Comment

      # Users
      can :create, User
      can :manage, User do |u|
        u == user
      end

      # Leaf
      can :create, Leaf
      can :read, Leaf

      can :update, Leaf

      can :manage, Leaf do |l|
        l.created_by_user == user
      end

      # Activity
      can :read, Activity
    end

    # :read, :create, :update and :destroy.

    
  end
end
