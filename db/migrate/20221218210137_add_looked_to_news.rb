class AddLookedToNews < ActiveRecord::Migration[6.1]
  def change
    add_column :news, :looked, :boolean, default: false
  end
end
