module ApplicationHelper
  def inline_editable(object)
    return unless current_administrator.present?
    content_for :head do
      render partial: 'optimadmin/shared/sidebar/inline_editing', locals: { object: object }
    end
  end

  def site_setting(type)
    global_site_settings[type]
  end
end
