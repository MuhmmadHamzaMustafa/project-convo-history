class Status < ApplicationRecord
  validates :name, presence: true

  before_save do
    self.slug = name.parameterize
  end
end
