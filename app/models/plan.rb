class Plan < ApplicationRecord
  belongs_to :trip
  has_many_attached :images

  with_options presence: true do
    validates :days_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :plan_title
    validates :content
    validates :trip_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days

end
