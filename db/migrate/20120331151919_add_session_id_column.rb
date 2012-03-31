class AddSessionIdColumn < ActiveRecord::Migration
  def up
    add_column(:games, "SessionID", :string)
  end

  def down
    remove_column(:games, "SessionID")
  end
end
