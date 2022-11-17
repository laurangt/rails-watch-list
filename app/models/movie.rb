class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, :overview, presence: true, uniqueness: true
  before_destroy :ensure_bookmark_not_using_movie

  private

  def ensure_bookmark_not_using_movie
    !bookmarks.nil?
  end
end
