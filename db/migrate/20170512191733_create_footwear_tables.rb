class CreateFootwearTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:cost, :decimal, precision: 100, scale: 2)
      t.timestamps
    end

    create_table(:brands_stores) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)
      t.timestamps
    end

    create_table(:stores) do |t|
      t.column(:name, :string)
      t.timestamps
    end
  end
end
