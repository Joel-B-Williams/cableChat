module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect 
      self.current_user = find_verified_user
      logger.add_tags 'Actioncable', current_user.email #displays log/debug info in console
    end

    protected

    def find_verified_user #checks if user auth'd with devise
      if verified_user = env['warden'].user #warden is used by devise, this essentially verifies the logged-in user in a similar way that a homebrew current_user would (ish)
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
