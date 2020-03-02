class Person < ApplicationRecord
    validates :name, presence: true
    enum kind: [ :prospective, :current_student, :faculty ] 

    has_and_belongs_to_many :schedule_items
end
