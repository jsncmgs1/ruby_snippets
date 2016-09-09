module DoWork
  def self.work
    GC::Profiler.enable
    x = 'x' * 1000 * 1000 * 100
    y = 'x' * 1000 * 1000 * 100
    puts GC::Profiler.report
    GC::Profiler.disable
  end
end

DoWork.work
