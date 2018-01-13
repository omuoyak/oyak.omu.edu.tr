class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  def admin
    role == 'admin' ? true : false
  end

  def writer
    role == 'writer' ? true : false
  end
end
