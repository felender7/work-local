class Referral < ApplicationRecord
  extend FriendlyId
  friendly_id :institution, use: :slugged
  belongs_to :user,optional: true
end
