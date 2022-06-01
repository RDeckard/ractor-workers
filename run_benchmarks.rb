# frozen_string_literal: true

require_relative './lib/tasks/tasks'
require_relative './lib/workers/workers'

require 'benchmark'
require_relative './lib/refinements'

using ClassHasDescendants

N = 4

Benchmark.bmbm do |test|
  Tasks::TaskBase.descendants.each do |task|
    Workers::WorkerBase.descendants.each do |worker|
      test.report("#{worker} calls `#{task}` #{N} times") do
        worker.new(task.new).call(N)
      end
    end
  end
end
