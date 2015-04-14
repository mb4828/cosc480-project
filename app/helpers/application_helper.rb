module ApplicationHelper

  def show_errors(object, field_name)
    if object.errors.any?
      if !object.errors.messages[field_name].blank?
        errormsg = "<span class='glyphicon glyphicon-asterisk' aria-hidden='true'></span> "
        errormsg += object.errors.messages[field_name].join(", ")
        errormsg.html_safe
      end
    end
  end 

end
