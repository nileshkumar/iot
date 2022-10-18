class FixColumnName < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :devices, :model_name, :variant_name
  end

  def self.down
    rename_column :devices, :variant_name, :model_name
  end
end
