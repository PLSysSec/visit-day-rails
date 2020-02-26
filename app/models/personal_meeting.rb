class PersonalMeeting < ApplicationRecord
  has_one :schedule_item
  has_and_belongs_to_many :students
end
