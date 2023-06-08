class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :activated,default: false
      t.string :activation_digest
      t.datetime :activated_at
      t.string :remember_digest

      t.timestamps
    end
  end
end
