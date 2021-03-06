class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :password, null: false
      t.string :name
      t.string :email, null: false

      t.timestamps
    end
  end
end
