module Filters

  def context
    @context || {}
  end
  module_function :context

  def context=(ctx)
    @context = ctx
  end
  module_function :context=

  def front_wrap
    (context[:emf_use_blocks] == true) ? "\\[\\[" : "\{\{"
  end
  module_function :front_wrap

  def end_wrap
    (context[:emf_use_blocks] == true) ? "\\]\\]" : "\}\}"
  end
  module_function :end_wrap

  def wrap_symbol
    (context[:emf_use_blocks] == true) ? "\\]" : "}"
  end
  module_function :wrap_symbol
end
