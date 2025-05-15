class Record < ApplicationRecord
  validates :body, presence: true
end