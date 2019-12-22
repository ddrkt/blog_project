class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.datetime :publish
      t.boolean :draft

      t.timestamps
    end
  end
end
