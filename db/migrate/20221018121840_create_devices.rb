class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.belongs_to :site, foreign_key: true
      t.string :model_name
      t.string :manufacturer

      t.timestamps
    end
  end
end
