class CreateChannelsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :channels_users do |t|
      t.integer :channel_id
      t.integer :user_id
    end
  end
end
