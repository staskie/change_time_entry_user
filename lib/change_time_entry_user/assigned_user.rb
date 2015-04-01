module ChangeTimeEntryUser
  class AssignedUser

    def self.call(time_entry)
      new(time_entry).call
    end

    attr_reader :time_entry

    def initialize(time_entry)
      @time_entry = time_entry
    end

    def call
      case
      when time_entry.user_id.present?
        time_entry.user_id
      when time_entry.issue.assigned_to.present?
        time_entry.issue.assigned_to.id
      else
        nil
      end
    end

  end
end
