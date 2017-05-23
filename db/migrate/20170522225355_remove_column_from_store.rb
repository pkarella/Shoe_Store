class RemoveColumnFromStore < ActiveRecord::Migration[5.1]
  def change
      remove_column(:brands,:store_id,:integer)
  end
end
