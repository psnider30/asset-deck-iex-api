class AddSharesToUserAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :user_assets, :shares, :integer, default:0
  end
end
