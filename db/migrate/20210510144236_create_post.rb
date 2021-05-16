class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :image
      t.timestamps
    end
  end
end
