class Task < ApplicationRecord

validates :title,      presence: true, length: { maximum: 50 }
validates :start_date, presence: true
validates :end_date,   presence: true
end
