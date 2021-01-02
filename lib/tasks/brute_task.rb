# frozen_string_literal: true

module Tasks
  class BruteTask < TaskBase
    ITERATIONS = 20_000_000

    def call
      ITERATIONS.times.inject(0) { |acc, i| acc + i }
    end
  end
end
