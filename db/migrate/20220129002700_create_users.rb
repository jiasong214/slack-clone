class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password_digest
      t.text :email
      t.text :title
      t.text :image
      t.integer :status, default: 0 

      t.timestamps
    end
  end
end
