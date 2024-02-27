class Trip < ApplicationRecord
  geocoded_by :place
  after_validation :geocode

  belongs_to :user
  has_many :plans, dependent: :destroy
  has_many_attached :images


  with_options presence: true do
    validates :trip_title, presence: { message: "を入力してください" }
    validates :place, presence: { message: "を入力してください" }
    validates :start_date, presence: { message: "を入力してください" }
    validates :end_date, presence: { message: "を入力してください" }
  end


  def self.search(search)
    if search != ""
      Trip.where('trip_title LIKE(?)', "%#{search}%")
    else
      Trip.all
    end
  end 
end
