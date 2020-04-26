class CreateChecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :checklists do |t|
      t.references  :day

      t.timestamps
    end
  end
end
