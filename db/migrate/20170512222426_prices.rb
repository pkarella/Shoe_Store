class Prices < ActiveRecord::Migration[5.1]
  def change
    create_table(:prices) do |t|
      t.column(:shoe_cost, :integer)
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)
      t.timestamps()
    end
  end
end
