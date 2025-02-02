class Comment < ApplicationRecord
  include PublicActivity::Model
  tracked owner: :user

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :body, presence: true
end
