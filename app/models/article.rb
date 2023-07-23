class Article < ApplicationRecord
  # validates_presence_of :title
  belongs_to :user
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
end
