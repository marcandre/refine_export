# frozen_string_literal: true

using RefineExport

module OtherExt
end

module Extension
  refine String, export: true do
    def twice
      self * 2
    end
  end

  refine String, export: OtherExt do
    def thrice
      self * 3
    end

    private def foo
      42
    end
  end
end
