class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
	delegate :content_tag, to: :@template

	def error_messages
		if object && object.errors.any?
			content_tag(:div, id: 'error_explanation') do
				content_tag(:h3, "#{object.errors.count}个错误") + 
					content_tag(:ul) do
						object.errors.full_messages.map do |msg|
							content_tag(:li, msg)
						end.join.html_safe
				end
			end
		end
	end
end
