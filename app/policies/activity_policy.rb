class ActivityPolicy
  attr_reader :user, :activity

  def initialize(user, activity)
    @user = user
    @activity = activity
  end

  def update?
    user.role == 'admin'
  end

  def new?
    user.role == 'admin'
  end

  def edit?
    user.role == 'admin'
  end

  def destroy?
    user.role == 'admin'
  end

  def create?
    user.role == 'admin'
  end

end
