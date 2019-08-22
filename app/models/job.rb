class Job < ApplicationRecord
  belongs_to :company_detail
  has_many :applied_jobs
  has_many :added_jobs, through: :applied_jobs, source: :user

  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user , optional: true

  #searchkick word_start: [:title, :city]
  #def search_data
    #{title: title, city: city}
  #end

  
end
