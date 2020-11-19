module ApplicationHelper
  def text_error_message_for(resource, field)
    error_message = resource.errors[field][0]
    if error_message
      field_name = resource.to_model.class.human_attribute_name(field)
      block_given? ? yield(field_name, error_message) : "#{field_name} #{error_message}"
    end
  end

  def error_message_for(resource, field, &block)
    error_content = text_error_message_for(resource, field, &block)
    if error_content
      content_tag(:span, error_content, class: "text-xs block mt-1 text-red-500")
    end
  end
end
