class CreateCustomLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :custom_links do |t|
      t.string      :name
      t.string      :link
      t.references  :day

      t.timestamps
    end
  end
end
