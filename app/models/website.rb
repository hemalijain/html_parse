class Website < ApplicationRecord
  has_many :contents
  validates :url, presence: true, uniqueness: true

end
