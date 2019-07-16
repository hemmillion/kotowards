class Proverb < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates_uniqueness_of :text
  
  def rate_average
    comments.average(:rate).round 
  end
end
