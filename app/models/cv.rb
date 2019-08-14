class Cv < ApplicationRecord
  extend FriendlyId
  validates :phone, presence: true
  friendly_id :id_passport, use: :slugged
  validates :identification_type, presence: true
  validates  :id_passport , presence: true
  validates_uniqueness_of :id_passport
  validates :date_of_birth, presence: true
  validates :place_of_birth, presence: true
  validates :disability, presence: true
  validates :education_type, presence: true
  validates :gender, presence: true
  validates :ethnicity, presence: true
  validates :job_function, presence: true
  validates :job_industry, presence: true
  validates :availability, presence: true
  validates :salary_range, presence: true
  validate :correct_image_type
  has_one_attached :avatar
  belongs_to :user , optional: true
  has_many :referrals, inverse_of: :cvs
  accepts_nested_attributes_for :referrals, reject_if: :all_blank, allow_destroy: true

  #has_many :referrals, dependent: :destroy
  #accepts_nested_attributes_for :referrals, allow_destroy: true, reject_if: proc { |att| att['institution'].blank? }


  def correct_image_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg))
      errors.add(:file, 'Must be a JPEG file')
    end
  end



end
