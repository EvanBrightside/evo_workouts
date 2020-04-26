class Measurement < ApplicationRecord
  validates :name, presence: true
  scope :sorted, -> { order('created_at DESC') }
  belongs_to :day, required: false

  def reasonable_name
    name
  end
end
