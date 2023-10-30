class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.belongs_to :ticket, null: false, foreign_key: true
      t.integer :weight
      t.timestamps
    end
  end
end
