class Review < ApplicationRecord
  belongs_to :list
  validates :rating, presence: true, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
