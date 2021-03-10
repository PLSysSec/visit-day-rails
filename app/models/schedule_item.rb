require 'active_support'
require 'active_support/core_ext/numeric/time'
class ScheduleItem < ApplicationRecord
    attribute :starts_at, :datetime, default: -> { ScheduleItem.start_date_time } 
    attribute :ends_at, :datetime, default: -> { ScheduleItem.start_date_time } 
    has_and_belongs_to_many :people

    def is_group_event?
        self.people.exists?(kind: :research_group)
    end

    def is_busy_time?
        self.people.count == 1
    end

    def group_name
        self.people.where(kind: :research_group)[0].name
    end

    def event_date
        self.starts_at_date
    end

    def event_date=(date)
        self.starts_at_date=date
        self.ends_at_date=date
    end

    def starts_at_date=(date)
        date = Date.parse date
        self.starts_at = self.starts_at.change(:year=>date.year, :month=>date.month, :day=>date.day)
    end
    def starts_at_date
        self.starts_at.to_date
    end
    def ends_at_date=(date)
        date = Date.parse date
        self.ends_at = self.ends_at.change(:year=>date.year, :month=>date.month, :day=>date.day)
    end
    def ends_at_date
        self.ends_at.to_date
    end

    def starts_at_time=(time)
        time = Time.parse time
        self.starts_at = self.starts_at.change(:hour=>time.hour, :min=>time.strftime("%M").to_i)
    end
    def starts_at_time
        self.starts_at.to_s(:time)
    end
    def ends_at_time=(time)
        time = Time.parse time
        self.ends_at = self.ends_at.change(:hour=>time.hour, :min=>time.strftime("%M").to_i)
    end
    def ends_at_time
        self.ends_at.to_s(:time)
    end

    def with_person=(id)
        p = Person.find id
        self.people << p unless self.people.include? p
    end

    def author=(id)
        with_person=(id)
    end

    def self.group_events
        ScheduleItem.includes(:people)
                    .where('people.kind' => :research_group)
                    .order(starts_at: :asc, ends_at: :asc)
    end

    private
    def ScheduleItem.start_date_time
        t = Rails.configuration.x.start_time
        d = Rails.configuration.x.days[0]
        dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, Time.zone_offset(t.zone))
    end
end
