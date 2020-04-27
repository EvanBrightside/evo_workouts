class TrainingVideo < ApplicationRecord
  include Adminos::FlagAttrs
  include Adminos::NestedSet::Duplication
  extend Enumerize

  has_rich_text :description

  flag_attrs :published

  enumerize :training_type, in: %i[morning main default], default: :main

  scope :sorted, -> { order('created_at DESC') }

  belongs_to :day, required: false

  def reasonable_name
    link
  end
end
