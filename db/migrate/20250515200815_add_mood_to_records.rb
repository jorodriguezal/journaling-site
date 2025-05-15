class AddMoodToRecords < ActiveRecord::Migration[8.0]
  def change
    add_column :records, :mood, :string
  end
end
