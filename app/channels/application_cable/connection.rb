# frozen_string_literal: true
# automagically loaded by rails and used by all channels
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = env['warden'].user || reject_unauthorized_connection
    end
  end
end
