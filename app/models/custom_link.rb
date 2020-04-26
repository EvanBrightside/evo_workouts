class CustomLink < ApplicationRecord
  validates :name, :link, presence: true
  scope :sorted, -> { order('created_at DESC') }
  belongs_to :day, required: false

  def reasonable_name
    name
  end
end
