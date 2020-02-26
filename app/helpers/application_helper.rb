module ApplicationHelper
    def flash_class(level)
        puts level == "alert"
        case level
            when "notice" then "alert alert-info"
            when "success" then "alert alert-success"
            when "error" then "alert alert-danger"
            when "alert" then "alert alert-danger"
        end
    end

    def is_admin?
        user_signed_in? && current_user.is_admin
    end
end
