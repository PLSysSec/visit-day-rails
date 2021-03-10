class Person < ApplicationRecord
    validates :name, presence: true
    enum kind: [ :prospective, :current_student, :faculty, :research_group ] 

    has_and_belongs_to_many :schedule_items

    def schedule_items
        items = ScheduleItem.includes(:people)
                    .where('people.id' => self.id)
                    .or(ScheduleItem.includes(:people)
                        .where(is_global: true)
                        .where(
                            if self.faculty?
                                {:include_faculty => true}
                            else
                                {}
                            end
                        ))
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

    def missing_links
        self.schedule_items.where(is_global: false, meeting_link: '').filter{|i| not i.is_busy_time?}
    end

    def schedule_conflicts
        items = self.schedule_items
        conflicts = []
        for i in items
            for j in items
                # By comparing id's we ensure that the conflict is only mentioned once
                if (i.starts_at > j.starts_at || (i.starts_at == j.starts_at && i.id < j.id)) && i.starts_at < j.ends_at
                    conflicts << [i,j]
                end

            end
        end
        conflicts
    end

end
