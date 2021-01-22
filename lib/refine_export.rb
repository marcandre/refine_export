# frozen_string_literal: true

require_relative 'refine_export/version'

module RefineExport
  refine Module do
    # See https://bugs.ruby-lang.org/issues/17374#note-8
    def refine(what, export: false)
      mod = super(what)
      return mod unless export

      export = self if export == true
      export.class_eval do
        mod.instance_methods(false).each do |method|
          define_method(method, mod.instance_method(method))
        end
        mod.private_instance_methods(false).each do |method|
          private define_method(method, mod.instance_method(method))
        end
      end
      mod
    end
  end
end
