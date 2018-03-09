class AddUuidToAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :assets, :uuid, :string
  end
end
