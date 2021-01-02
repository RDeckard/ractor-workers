# frozen_string_literal: true

module Workers
  class RactorsWorker < WorkerBase
    def call(iterations)
      Array.new(iterations) do
        Ractor.new(self, &:call_task!)
      end.each(&:take)
    end
  end
end
