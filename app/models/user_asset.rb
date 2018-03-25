class UserAsset < ApplicationRecord

  belongs_to :user
  belongs_to :asset
  validates :shares, numericality: { greater_than: -1 }
  validate :unique_asset_per_user


  def unique_asset_per_user
    user = User.find(user_id)
    asset = Asset.find(asset_id)
    symbol = asset.symbol
    errors.add(:asset_id, ": You already added #{symbol}") if user.assets.where(:symbol => symbol).present?
  end

end
