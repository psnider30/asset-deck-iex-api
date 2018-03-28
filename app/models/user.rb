class User < ApplicationRecord

  has_many :user_assets
  has_many :assets, through: :user_assets
  has_secure_password
  attr_accessor :user_asset_shares

  validates_uniqueness_of :username, :email

  def user_asset_shares(asset_id)
    UserAsset.find_by(user_id: self_id, asset_id: asset_id).shares
  end

end
