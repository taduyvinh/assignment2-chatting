class AddReadToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :read, :boolean, default: false
    add_column :messages, :read_at, :datetime
  end
end
