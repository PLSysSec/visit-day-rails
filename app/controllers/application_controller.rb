class ApplicationController < ActionController::Base
    http_basic_authenticate_with name: Rails.configuration.x.http_auth[:username], password: Rails.configuration.x.http_auth[:password]

    private
    def require_admin!
        if !helpers.is_admin?
            raise ActionController::RoutingError.new('Not Found')
        end
    end

end
