class User < ApplicationRecord
  validates :password, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name, presence: true
  
  has_many :favorites
  has_many :favorite_books, through: :favorites, source: 'book'
  has_many :purchaseds
  has_many :purchased_books, through: :purchaseds, source: 'book'
  has_many :reads
  has_many :reed_books, through: :reeds, source: 'book'
  has_many :quentions
  
  has_secure_password
end
