class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string      :name
      t.boolean     :published, default: true, null: false
      t.integer     :number
      t.string      :checklist_name
      t.string      :measurement_name
      t.references  :week

      t.timestamps
    end
  end
end
