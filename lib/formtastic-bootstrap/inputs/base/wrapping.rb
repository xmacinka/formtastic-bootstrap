module FormtasticBootstrap
  module Inputs
    module Base
      module Wrapping

        include Formtastic::Inputs::Base::Wrapping

        def bootstrap_wrapping(&block)
          form_group_wrapping do
            label_html <<
            template.content_tag(:div, :class => 'controls') do
              input_content(&block) <<
              hint_html(:block) <<
              error_html(:block)
            end
          end
        end

        def input_content(&block)
          content = [
            add_on_content(options[:prepend]),
            options[:prepend_content],
            yield,
            add_on_content(options[:append]),
            options[:append_content]
          ].compact.join("\n").html_safe

          if prepended_or_appended?(options)
            template.content_tag(:div, content, :class => add_on_wrapper_classes(options).join(" "))
          else
            content
          end
        end

        def prepended_or_appended?(options)
          options[:prepend] || options[:prepend_content] || options[:append] || options[:append_content]
        end

        def add_on_content(content)
          return nil unless content
          template.content_tag(:span, content, :class => 'add-on')
        end

        def form_group_wrapping(&block)
          template.content_tag(:div,
            template.capture(&block).html_safe,
            wrapper_html_options
          )
        end

        def wrapper_html_options
          super.tap do |options|
            options[:class] << " control-group"
            options[:class] << " has-error" if errors?
          end
        end

        def add_on_wrapper_classes(options)
          ret = []
          ret += [:prepend, :prepend_content].find do |key|
            options.has_key?(key)
          end ? ['input-prepend'] : []
          ret += [:append, :append_content].find do |key|
            options.has_key?(key)
          end ? ['input-append'] : []
          ret
        end

      end
    end
  end
end
