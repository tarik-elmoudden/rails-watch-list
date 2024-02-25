class Bookmark < ApplicationRecord
  validates :comment, presence: true
  belongs_to :movie
  belongs_to :list

  validates :movie_id, uniqueness: { scope: :list_id }

  # Prevent deletion of movie if it is referenced in at least one bookmark
  before_destroy :check_movie_presence_in_bookmarks

  private

  def check_movie_presence_in_bookmarks
    if movie.bookmarks.any?
      errors.add(:base, "Cannot delete movie referenced in bookmarks")
      throw :abort
    end
  end
end
