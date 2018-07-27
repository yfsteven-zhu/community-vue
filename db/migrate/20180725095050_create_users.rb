class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.boolean :admin, default: false
      t.string :picture
      t.string :introduction


      t.timestamps

    end

    add_index :users, :name, unique: true
  end
end
