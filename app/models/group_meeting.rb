class GroupMeeting < ApplicationRecord
  has_one :schedule_item
  belongs_to :group
end
