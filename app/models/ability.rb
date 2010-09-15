class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    alias_action :index, :on_depot, :to => :read

    if user.has_role? :super_admin
      can :manage, :all
    elsif user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
      can :read, [Unit, Room, User]
    end
  end
end