class Trip < ApplicationRecord
  geocoded_by :place
  after_validation :geocode

  belongs_to :user
  has_many :plans, dependent: :destroy
  has_many :trip_comments, dependent: :destroy
  has_many_attached :images


  with_options presence: true do
    validates :trip_title, presence: { message: "を入力してください" }
    validates :place, presence: { message: "を入力してください" }
    validates :start_date, presence: { message: "を入力してください" }
    validates :end_date, presence: { message: "を入力してください" }
  end


  def self.search(trip_title, place)
    if trip_title.present? || place.present?
      Trip.where('trip_title LIKE ? OR place LIKE ?', "%#{trip_title}%", "%#{place}%")
    else
      Trip.all
    end
  end
end
