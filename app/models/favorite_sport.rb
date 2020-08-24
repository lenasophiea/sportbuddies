class FavoriteSport < ApplicationRecord
  belongs_to :user
  belongs_to :sport
end
