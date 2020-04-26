class Checklist < ApplicationRecord
  scope :sorted, -> { order('created_at DESC') }

  belongs_to :day, required: false

  has_rich_text :check_point

  def reasonable_name
    check_point
  end
end
