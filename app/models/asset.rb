class Asset < ApplicationRecord

  has_many :user_assets
  has_many :users, through: :user_assets

  validates_uniqueness_of :symbol, :uuid
  
end
