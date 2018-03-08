class UserAsset < ApplicationRecord

  belongs_to :user
  belongs_to :asset
  validate :unique_asset_per_user

  def unique_asset_per_user
    user = User.find(user_id)
    symbol = Asset.find(asset_id).symbol
    if user.assets.find { |asset| asset.symbol == symbol }
      errors.add(:id, "You already added #{symbol}")
    end
  end

end
