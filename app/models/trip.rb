class Trip < ApplicationRecord
  has_many :users, through: :trip_users
  has_many :trip_users, dependent: :destroy
  has_many :plans, dependent: :destroy
  accepts_nested_attributes_for :trip_users


  with_options presence: true do
    validates :trip_title
    validates :place
    validates :start_date
    validates :end_date
  end
end
