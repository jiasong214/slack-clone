class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.text :name
      t.text :description
      t.boolean :private
      t.integer :owner_id

      t.timestamps
    end
  end
end
