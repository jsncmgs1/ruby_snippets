# Credit to Alexander Dymo, 'Ruby Performance Optimization'
#
# Sometimes we want to benchmark with the GC off, and sometimes we don't
# Here, we want the GC on. When we deal with loops we need to be careful how
# we take measurements.

require 'benchmark'

module DoWork
  def self.wrong
    100.times do
      # this is not the correct way to benchmark an operation,
      # as we iterate we are adding objects to the heap, so the GC has more
      # things to deal with after each iteration.

      GC.start
      measurement = Benchmark.realtime do
        array_of_big_strings = Array.new(1000) { 'x' * 1000 * 1000 }
      end

      puts measurement
    end
  end

  def self.right
    100.times do
      # this is how we want to do it, by forking the process before each benchmark,
      # we can ensure that each measurement is taken in the same state, so the
      # GC should fire at relatively the same time on each measurement

      GC.start

      pid = fork do
        GC.start
        measurement = Benchmark.realtime do
          array_of_big_strings = Array.new(1000) { 'x' * 1000 * 1000 }
        end

        puts measurement
      end

      Process::waitpid(pid)
    end

  end
end

# DoWork.wrong
DoWork.right
