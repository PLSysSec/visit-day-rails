namespace :visitday do
    desc "Used to invite a user as admin. Useful for bootstrapping the service"
    task :invite_admin, [:email] => :environment do |t, args|
        Rails.logger = Logger.new(STDOUT) 
        Rails.logger.level = Logger::DEBUG
        u = User.invite!(email: args.email, is_admin: true)
        include Rails.application.routes.url_helpers
        puts u.inspect
        puts ApplicationController.new.render_to_string(
            :template => 'users/mailer/invitation_instructions.text',
            :locals => { :@resource => u, :@token => u.raw_invitation_token }
        )
    end
end
