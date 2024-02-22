class Plan < ApplicationRecord
  belongs_to :trip

  with_options presence: true do
    validates :plan_title
    validates :content
    validates :trip_id
  end
end
