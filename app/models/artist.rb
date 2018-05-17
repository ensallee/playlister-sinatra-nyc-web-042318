class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(/[^0-9A-Za-z]/, '-').downcase
  end

  def self.find_by_slug(slug)
    Artist.all.find do |artist|
      artist.slug == slug
    end
  end
end