require 'active_support'
require 'active_support/core_ext/numeric/time'
class ScheduleItem < ApplicationRecord
    attribute :starts_at, :datetime, default: -> { ScheduleItem.start_date_time } 
    attribute :ends_at, :datetime, default: -> { ScheduleItem.start_date_time } 
    has_and_belongs_to_many :people

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
        logger.warn time
        time = Time.parse time
        logger.warn "END TIMES!"
        logger.warn time.strftime("%M")
        self.ends_at = self.ends_at.change(:hour=>time.hour, :min=>time.strftime("%M").to_i)
    end
    def ends_at_time
        self.ends_at.to_s(:time)
    end

    def with_person=(id)
        self.people << (Person.find id)
    end

    private
    def ScheduleItem.start_date_time
        x = Rails.configuration.x.days[0].change hour: Rails.configuration.x.start_time.hour, min: Rails.configuration.x.start_time.min
        logger.warn x
        x
    end
end
