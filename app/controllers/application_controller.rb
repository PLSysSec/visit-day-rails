class ApplicationController < ActionController::Base

    private
    def require_admin!
        if !helpers.is_admin?
            raise ActionController::RoutingError.new('Not Found')
        end
    end

end
