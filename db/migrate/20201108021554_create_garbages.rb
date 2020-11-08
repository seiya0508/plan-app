class CreateGarbages < ActiveRecord::Migration[6.0]
  def change
    create_table :garbages do |t|
      t.date :day
      t.string :category
      t.string :other
      t.string :dom
      t.timestamps
    end
  end
end
