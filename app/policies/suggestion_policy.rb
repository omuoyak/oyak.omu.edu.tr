class SuggestionPolicy
  attr_reader :user, :suggestion

  def initialize(user, suggestion)
    @user = user
    @suggestion = suggestion
  end

  def update?
    user.role == 'admin'
  end

  def new?
    ["admin","writer"].include? user.role
  end

  def edit?
    user.role == 'admin'
  end

  def destroy?
    user.role == 'admin'
  end

  def create?
    ["admin","writer"].include? user.role
  end

end
