class Article < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true
end
