class Week < ApplicationRecord
  include Adminos::Slugged
  include Adminos::FlagAttrs
  include Adminos::Recognizable
  include Adminos::NestedSet::Duplication
  slugged :recognizable_name
  flag_attrs :published
  acts_as_recognizable :recognizable_name

  validates :name, :number, presence: true

  scope :sorted, -> { order('created_at DESC') }

  has_many :days, dependent: :nullify

  def reasonable_name
    name
  end

  def recognizable_name
    slug.present? ? slug : reasonable_name
  end

  def changed_for_autosave?
    super || (week_plan.changed_for_autosave? if week_plan.attached?)
  end
end
