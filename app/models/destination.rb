class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

   # - The average age of all unique bloggers who have written about this destination.
  def unique_bloggers
    self.posts.map do |post|
      post.blogger
    end.uniq
  end

  def average_age
    sum = 0 
    unique_bloggers.each do |blogger|
      sum += blogger.age
      # byebug
    end
    sum / unique_bloggers.size
  end
end
