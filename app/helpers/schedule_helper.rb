module ScheduleHelper
    def string_name_for(person, item)
        if item.is_group_event?
            "#{item.group_name}: #{item.name}"
        elsif !item.name.nil?
            item.name
        elsif item.is_busy_time?
            "Busy"
        else
            "Meeting with #{item.people.all.map(&:name).join(', ')}"
        end
    end

    def group_meeting_info(item)
        day = item.starts_at.strftime '%d/%m'
        start_time = item.starts_at.strftime '%I:%M%P'
        end_time = item.ends_at.strftime '%I:%M%P'
        raw("<b>#{item.group_name}: #{item.name}</b> #{day} #{start_time}-#{end_time}")
    end

    def conflict_text(person, item1, item2)
        "#{string_name_for(@person, item1)} at #{item1.starts_at.strftime("%I:%M%p")} conflicts with #{string_name_for(@person, item2)} at #{item2.starts_at.strftime("%I:%M%p")}" 
    end
end
