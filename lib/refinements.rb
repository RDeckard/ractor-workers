# frozen_string_literal: true

module ClassHasDescendants
  refine Class do
    def descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }.reverse
    end
  end
end
