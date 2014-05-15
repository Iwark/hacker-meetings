class AddBelongingToUser < ActiveRecord::Migration
  def change
    add_column :users, :belonging, :string
  end
end
