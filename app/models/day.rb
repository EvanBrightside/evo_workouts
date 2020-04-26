class Day < ApplicationRecord
  include Adminos::FlagAttrs
  include Adminos::NestedSet::Duplication

  before_create :record_name

  has_rich_text :content
  has_rich_text :checklist_description
  has_rich_text :measurement_description

  flag_attrs :published

  validates :number, presence: true

  scope :sorted, -> { order('created_at ASC') }

  belongs_to :week, required: false
  has_many :training_videos, dependent: :nullify
  has_many :checklists, dependent: :nullify
  has_many :measurements, dependent: :nullify
  has_many :custom_links, dependent: :nullify
  accepts_nested_attributes_for :training_videos,
                                :checklists,
                                :measurements,
                                :custom_links, reject_if: :all_blank, allow_destroy: true

  def reasonable_name
    (name || number)
  end

  private

  def record_name
    return unless week.number.present?

    self.name = "week_#{week.number}_day_#{number}"
  end
end
