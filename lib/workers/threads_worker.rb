# frozen_string_literal: true

module Workers
  class ThreadsWorker < WorkerBase
    def call(iterations)
      Array.new(iterations) do
        Thread.new do
          call_task!
        end
      end.each(&:join)
    end
  end
end
