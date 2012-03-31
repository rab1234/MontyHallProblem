class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :w_door
      t.integer :u_door
      t.integer :show_door
      t.integer :other_door

      t.timestamps
    end
  end
end
