# frozen_string_literal: true

module Workers
  class ClassicWorker < WorkerBase
    def call(iterations)
      iterations.times do
        call_task!
      end
    end
  end
end
