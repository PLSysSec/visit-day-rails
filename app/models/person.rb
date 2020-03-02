class Person < ApplicationRecord
    validates :name, presence: true
    enum kind: [ :prospective, :current_student, :faculty ] 

    has_and_belongs_to_many :schedule_items

    def schedule_items
        ScheduleItem.includes(:people).where('people.id' => self.id).order(starts_at: :asc)
    end

    def schedule_conflicts
        items = self.schedule_items
        conflicts = []
        for i in items
            for j in items
                if i == j
                    next
                end

                if i.starts_at >= j.starts_at && i.starts_at < j.ends_at && i.ends_at < j.ends_at
                    conflicts << [i,j]
                end

            end
        end

        conflicts
    end

end
