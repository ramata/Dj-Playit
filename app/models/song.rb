class Song < ApplicationRecord
  belongs_to :artists
  has_many   :comments
end
