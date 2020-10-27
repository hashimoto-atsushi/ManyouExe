class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy
  validates :name, presence: true,
                   length: { maximum: 30 }
  validates :email, presence: true,
                     length: { maximum: 128 },
                     format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase }
  validates :password, presence: true,
                        length: { minimum: 6 }

  before_destroy :before_destory_admin


  private
  def before_destory_admin
    if User.find(id).admin
      throw :abort
      redirect_to tasks_path
    end
  end
end
