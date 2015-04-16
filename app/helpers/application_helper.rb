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

  def show_errors_params(params, field_name)
      return if not params.has_key?(field_name)
      if params[field_name].errors.any?
      end
  end

end
