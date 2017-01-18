module FormtasticBootstrap
  module Inputs
    module Base
      module Errors

        include Formtastic::Inputs::Base::Errors

        def error_html(inline_or_block = :inline)
          errors? ? send(:"error_#{builder.inline_errors}_html", inline_or_block) : ""
        end

        def error_sentence_html(inline_or_block)
          error_class = if inline_or_block == :inline
            options[:error_class] || builder.default_inline_error_class
          else
            options[:error_class] || builder.default_block_error_class
          end
          template.content_tag(:span, Formtastic::Util.html_safe(errors.to_sentence.html_safe), :class => error_class)
        end

        def error_list_html(ignore)
          super()
          # error_class = options[:error_class] || builder.default_error_list_class
          # list_elements = []
          # errors.each do |error|
          #   list_elements << template.content_tag(:li, Formtastic::Util.html_safe(error.html_safe))
          # end
          # template.content_tag(:ul, Formtastic::Util.html_safe(list_elements.join("\n")), :class => error_class)
        end

        def error_first_html(inline_or_block = :inline)
          error_class = if inline_or_block == :inline
            options[:error_class] || builder.default_inline_error_class
          else
            options[:error_class] || builder.default_block_error_class
          end
          template.content_tag(:span, Formtastic::Util.html_safe(errors.first.untaint), :class => error_class)
        end

        def error_none_html(ignore)
          # super
          ""
        end

        def error_keys
          keys = [method.to_sym]
          keys << options[:additional_error_keys] if options[:additional_error_keys].present?
          keys << builder.file_metadata_suffixes.map{|suffix| "#{method}_#{suffix}".to_sym} if file?
          keys << association_primary_key if belongs_to? || has_many?
          keys.flatten.compact.uniq
        end
      end
    end
  end
end
