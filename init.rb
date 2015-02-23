require 'redmine'

Redmine::Plugin.register :change_time_entry_user do
  name 'Change Time Entry User plugin'
  author 'Dominik Staskiewicz'
  description 'Log time as a different person'
  version '0.0.1'
  url 'http://dapplication.com'
  author_url 'http://dapplication.com'

  # It can probably work with earlier versions as well
  requires_redmine :version_or_higher => '2.6.0'

  project_module :change_time_entry_user do
    permission :change_time_entry_user, {}
  end
end

require_relative 'lib/change_time_entry_user/time_entry_patch'
require_relative 'lib/change_time_entry_user/hooks'

Rails.configuration.to_prepare do
  TimeEntry.send(:include, ChangeTimeEntryUser::TimeEntryPatch)
end
