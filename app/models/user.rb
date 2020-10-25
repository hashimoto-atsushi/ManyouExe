class User < ApplicationRecord
  has_secure_password
  has_many :tasks
  validates :name, present: true,
                   length: {maximum: 30}
  validates :email, present: true,
                     length: {maximum: 128}
                     format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :passowrd, present: true,
                        length: { minimum: 6 }
end
