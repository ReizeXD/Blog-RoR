class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.boolean :anon, default: true

      t.timestamps
    end
  end
end
