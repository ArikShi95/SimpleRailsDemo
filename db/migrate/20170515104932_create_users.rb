class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :password
      t.string :remember
      t.timestamps null: false
    end
  end
end
