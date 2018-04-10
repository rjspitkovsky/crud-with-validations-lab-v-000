class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validate :past_release_year?


  def past_release_year?
    if release_year != nil && release_year > Time.new.year
      errors.add("release year cannot be in the future")
    end
  end
end
