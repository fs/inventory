class AddOutOfOrderFieldToUnits < ActiveRecord::Migration
  def self.up
    add_column :units, :out_of_order, :boolean, :default => false
    add_column :units, :out_of_order_note, :text
  end

  def self.down
    remove_column(:units, :out_of_order, :out_of_order_note)
  end
end
