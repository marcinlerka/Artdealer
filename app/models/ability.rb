class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :artist
      can :read, User
      can :read, Artwork
      can [:create, :update, :destroy], Artwork do |artwork|
        artwork.try(:user) == user # Artist can CUD only artworks he owns
      end
    elsif user.role? :buyer
      can :read, User
      can :read, Artwork
    end
  end
end
