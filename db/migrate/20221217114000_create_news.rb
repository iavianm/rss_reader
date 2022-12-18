class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :title
      t.string :link
      t.string :author
      t.string :description
      t.datetime   :pubdate

      t.references :channel, null: false, foreign_key: true

      t.timestamps
    end
    add_index :news, :title
    add_index :news, :pubdate
  end
end
