class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :movie_name
      t.datetime :show_time
      t.integer :duration
      t.integer :stock
      t.integer :price
      t.string :status
      t.string :uuid
      t.text :description

      t.timestamps
    end
  end
end
