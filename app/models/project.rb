class Project < ApplicationRecord
  include PublicActivity::Model
  tracked owner: :user


  belongs_to :status
  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy

  validates :title, :status_id, presence: true

  def self.all_statuses
    Status.where(statusable_type: "Project")
  end

  before_validation do
    self.status_id ||= status_id_for("due")
  end

  def self.status_id_for(slug)
    all_statuses.where(slug: slug).first&.id
  end
end
