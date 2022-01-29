class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.text :name
      t.text :description
      t.boolean :private
      t.integer :user_id
      t.jsonb :user_list

      t.timestamps
    end
  end
end
