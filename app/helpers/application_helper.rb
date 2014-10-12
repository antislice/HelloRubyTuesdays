module ApplicationHelper

   def full_title(page_title)
      base_title = "HelloRubyTuesday"
      if page_title.empty?
         base_title
      else
         "#{base_title} | #{page_title}"
      end
   end

  def flash_to_bootstrap(alert_type)
    case alert_type
      when :alert
        return 'danger'
      when :notice
        return 'success'
      else
        return ''
    end
  end

end
