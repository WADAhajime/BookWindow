class Book < ApplicationRecord
  has_many :sale_books
  has_many :stores, through: :sale_books
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :purchaseds
  has_many :purchased_users, through: :purchaseds, source: 'user'
  has_many :reads
  has_many :reed_users, through: :reeds, source: 'user'
end
