class CreateChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :channels do |t|
      t.string :title
      t.string :url

      t.timestamps
    end

    add_index :channels, :title,                unique: true
    add_index :channels, :url,                  unique: true
  end
end
