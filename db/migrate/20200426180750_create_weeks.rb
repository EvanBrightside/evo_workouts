class CreateWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :weeks do |t|
      t.string   :name
      t.boolean  :published, default: true, null: false
      t.string   :slug
      t.integer  :number
      t.string   :week_plan_link

      t.timestamps
    end
  end
end
