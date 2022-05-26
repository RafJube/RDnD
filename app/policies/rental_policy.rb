class RentalPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    user.present? && record.duck.user != user
  end

  def update?
    user.present? && record.user == user
  end

  def destroy?
    user.present? && record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
