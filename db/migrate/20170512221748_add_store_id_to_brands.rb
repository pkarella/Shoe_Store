class AddStoreIdToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column(:brands,:store_id,:integer)
  end
end
