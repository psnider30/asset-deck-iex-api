class CreateUserAssets < ActiveRecord::Migration[5.1]

  def change
    create_table :user_assets do |t|
      t.integer :user_id
      t.integer :asset_id

      t.timestamps
    end
  end
end
