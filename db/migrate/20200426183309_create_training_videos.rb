class CreateTrainingVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :training_videos do |t|
      t.string      :link
      t.string      :training_type
      t.references  :day

      t.timestamps
    end
  end
end
