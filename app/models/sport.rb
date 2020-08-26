class Sport < ApplicationRecord
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_sport_filter,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
