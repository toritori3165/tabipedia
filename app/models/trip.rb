class Trip < ApplicationRecord
  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  has_many :plans, dependent: :destroy
  has_many_attached :images


  with_options presence: true do
    validates :trip_title
    validates :place
    validates :start_date
    validates :end_date
  end

  def self.search(search)
    if search != ""
      Trip.where('trip_title LIKE(?)', "%#{search}%")
    else
      Trip.all
    end
  end 
end
