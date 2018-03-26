class UserAsset < ApplicationRecord

  belongs_to :user
  belongs_to :asset
  validates :shares, :numericality => { greater_than_or_equalt_to: 0 }
  validate :unique_asset_per_user_unless_updating_shares


  def unique_asset_per_user_unless_updating_shares
    user = User.find(user_id)
    asset = Asset.find(asset_id)
    symbol = asset.symbol
    errors.add(:asset_id, ": You already added #{symbol}") if user.assets.where(:symbol => symbol).present? && self.shares < 0
  end

  def add_share
    self.shares += 1
  end

  def remove_share
    self.shares -= 1
  end

end
