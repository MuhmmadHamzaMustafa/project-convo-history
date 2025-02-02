PublicActivity::Activity.class_eval do
  belongs_to :owner, class_name: 'User', optional: true
  belongs_to :recipient, polymorphic: true, optional: true

  validates :key, presence: true
  validate :owner_or_anonymous

  private

  def owner_or_anonymous
    return if owner.present? || key.include?('anonymous')
    errors.add(:owner, "must exist for non-anonymous activities")
  end
end