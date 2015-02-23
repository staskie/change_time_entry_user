module ChangeTimeEntryUser
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_timelog_edit_form_bottom, :partial => 'timelog/change_time_entry_user'
  end
end
