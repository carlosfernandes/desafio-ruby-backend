class AddOwnerToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :owner, :string
  end
end
