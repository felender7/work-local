class Document < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  validate :correct_document_mime_type
  has_one_attached :file
  belongs_to :user , optional: true

  WATERMARK_PATH = Rails.root.join('lib', 'assets', 'images', 'watermark.png')

  private

  def correct_document_mime_type
    if file.attached? && !file.content_type.in?(%w(application/pdf))
      errors.add(:file, 'Must be a PDF file')
    end
  end

end
