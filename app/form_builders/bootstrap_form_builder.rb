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

	%w(text_field text_area url_field file_field collection_select select).each do |method_name|
		define_method(method_name) do |method, *tag_value|
			content_tag(:div, class: "form-group") do
				label(method, class: 'col-lg-1 control-label')+ 
					content_tag(:div, class: 'col-lg-11') do
						super(method, *tag_value)
					end
			end
		end
	end

	def submit(*tag_value)
		content_tag(:div, class: 'form-group') do
			content_tag(:div, class: 'col-lg-12 col-lg-offset-1') do
				super
			end
		end
	end
end
