class DuckPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  # All logged-in users can create Ducks
  def create?
    return true
  end

  def show?
    true
  end
end
