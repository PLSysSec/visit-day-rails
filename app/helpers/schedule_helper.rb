module ScheduleHelper
    def string_name_for(person, item)
        if !item.name.nil?
            item.name
        else
            "Meeting with #{item.people.all.map(&:name).join(', ')} at #{item.starts_at.strftime("%I:%M%p")}"
        end
    end

    def conflict_text(person, item1, item2)
        "#{string_name_for(@person, item1)} conflicts with #{string_name_for(@person, item2)}" 
    end
end
