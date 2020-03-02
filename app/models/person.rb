class Person < ApplicationRecord
    validates :name, presence: true
    enum kind: [ :prospective, :current_student, :faculty, :research_group ] 

    has_and_belongs_to_many :schedule_items

    def schedule_items
        items = ScheduleItem.includes(:people)
                    .where('people.id' => self.id)
                    .or(ScheduleItem.includes(:people).where(is_global: true))
                    .order(starts_at: :asc, ends_at: :asc)
    end

    def has_openings
        prev = nil
        for ev in self.schedule_items
            if prev != nil && (ev.starts_at - prev) / 1.minute > 15
                return true
            end
            prev = ev.ends_at
        end
    end

    def schedule_conflicts
        items = self.schedule_items
        conflicts = []
        for i in items
            for j in items
                if i == j
                    next
                end
                # By comparing id's we ensure that the conflict is only mentioned once
                if i.starts_at >= j.starts_at && i.starts_at < j.ends_at && i.id < j.id
                    conflicts << [i,j]
                end

            end
        end
        logger.warn conflicts
        conflicts
    end

end
