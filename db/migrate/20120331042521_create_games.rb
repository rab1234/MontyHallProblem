class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :w_door
      t.integer :u_door
      t.integer :show_door
      t.integer :other_door
      t.integer :sw_door
      t.boolean :switched
      t.boolean :won
      t.timestamps
    end
  end
end
