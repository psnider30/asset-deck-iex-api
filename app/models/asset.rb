class Asset < ApplicationRecord

  has_many :user_assets
  has_many :users, through: :user_assets
  attr_accessor :user_asset_shares

  validates_uniqueness_of :symbol, :uuid

  def user_asset_shares(user_id)
    UserAsset.find_by(user_id: user_id, asset_id: self.id).shares
  end

end
