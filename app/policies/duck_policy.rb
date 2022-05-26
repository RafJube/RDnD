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

  # All logged-in users can show Ducks
  def show?
    true
  end

  # Only current user can delete their Ducks
  def destroy?
    user.present? && record.user == user
  end

  # Only current user can update their Ducks
  def update?
    user.present? && record.user == user
  end
end
