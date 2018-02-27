class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
      t.string :symbol
      t.string :company_name
      t.float :open
      t.float :close
      t.float :latest_price
      t.float :point_change
      t.float :change_percent
      t.string :sector
      t.string :latest_time

      t.timestamps
    end
  end
end
