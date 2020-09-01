class Sport < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :favorite_sports, source: :user
  has_many :buddy_requests

  include PgSearch::Model
  pg_search_scope :search_by_sport_filter,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
