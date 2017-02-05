class Song < ApplicationRecord
  belongs_to :artists
  belongs_to :user
  has_many   :comments
end
