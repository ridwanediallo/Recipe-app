# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
     if user.role == 'admin'
      can :manage, :all
    else
      can :destroy, Recipe do |recipe|
        recipe.user == user
      end

      can :create, Recipe
    end
  end
end
