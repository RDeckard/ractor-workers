# frozen_string_literal: true

module Workers
  class RactorsWorker < WorkerBase
    def call(iterations)
      iterations.times.map do
        Ractor.new(self, &:call_task!)
      end.each(&:take)
    end
  end
end
