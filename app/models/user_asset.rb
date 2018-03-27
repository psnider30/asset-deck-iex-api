class UserAsset < ApplicationRecord

  belongs_to :user
  belongs_to :asset
  validates :shares, :numericality => { greater_than_or_equalt_to: 0 }
  validate :unique_asset_per_user, on: :create


  def unique_asset_per_user
    user = User.find(user_id)
    asset = Asset.find(asset_id)
    symbol = asset.symbol
    errors.add(:asset_id, ": You already added #{symbol}") if user.assets.where(:symbol => symbol).present?
  end

  def add_share
    self.shares += 1
  end

  def remove_share
    self.shares -= 1
  end

end
