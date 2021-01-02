# frozen_string_literal: true

require_relative '../refinements'

using ClassHasDescendants

module Workers
  class WorkerBase
    def initialize(task)
      @task = task
    end

    def call(_iterations)
      raise NotImplementedError,
            "#call(Integer) method must be implemented in #{self.class.name}"
    end

    def call_task!
      @task.call
    end
  end
end
