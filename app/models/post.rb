class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination
  validates :title, presence: { message: "needs to eats yogurt" }
  validates :content, length: { minimum: 100 }
end
