class CreateRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :records do |t|
      t.datetime :date
      t.text :body

      t.timestamps
    end
  end
end
