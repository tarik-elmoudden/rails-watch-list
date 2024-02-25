class Movie < ApplicationRecord
  validates :title, presence: true
  validates :overview, presence: true
  validates :poster_url, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  has_many :bookmarks, dependent: :restrict_with_error
  has_many :lists, through: :bookmarks

end
