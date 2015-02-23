require 'time_entry'

module ChangeTimeEntryUser
  module TimeEntryPatch
    def self.included(base)
      base.class_eval do
        alias_attribute :unprotected_user_id, :user_id
        safe_attributes :unprotected_user_id
      end
    end
  end
end

