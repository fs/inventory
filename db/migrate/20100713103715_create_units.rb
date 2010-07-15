class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.string :unit_type
      t.integer :inv_id
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :room_id
      t.boolean :on_depot, :default => false

      t.timestamps
    end

    add_index(:units, :user_id)
    add_index(:units, :room_id)
    add_index(:units, :inv_id, :uniq => true)
  end

  def self.down
    drop_table :units
  end
end
