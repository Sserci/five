class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true
      t.date :date
      t.integer :nb_places
      t.integer :level

      t.timestamps
    end
  end
end
