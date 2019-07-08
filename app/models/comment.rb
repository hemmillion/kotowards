class Comment < ApplicationRecord
  belongs_to :proverb
  belongs_to :user
end
