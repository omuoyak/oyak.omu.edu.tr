class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    user.role == 'admin'
  end

  def new?
    ["admin","writer"].include? user.role
  end

  def edit?
    user.role == 'admin'
    # TODO: En azından 1 sürümlük versiyonlama sonrası alt satırı aktif et.
    # (post.user_id == user.id) || (user.role == 'admin')
  end

  def destroy?
    user.role == 'admin'
  end

  def create?
    ["admin","writer"].include? user.role
  end

end
