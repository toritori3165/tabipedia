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

  def self.default
    dummy_data = {
      "id": '1',
      "trip_title": 'おすすめの旅を投稿してね！',
      "place": 'dummy',
      "start_date": '2024-02-29',
      "end_date": '2024-02-29',
      "latitude": '35.0',
      "longitude": '135.0',
      "user_id": '0'
    }
    new(dummy_data)
  end

  def self.find_with_default(id)
    if all.length.positive?
      find(id)
    else
      default
    end
  end

  def self.search(trip_title, place)
    if trip_title.present? || place.present?
      Trip.where('trip_title LIKE ? OR place LIKE ?', "%#{trip_title}%", "%#{place}%")
    else
      Trip.all
    end
  end
end