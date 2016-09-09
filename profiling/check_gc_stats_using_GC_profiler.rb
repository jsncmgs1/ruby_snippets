module DoWork
  def self.work
    GC::Profiler.enable
    x = 'x' * 1000 * 1000 * 100
    y = 'x' * 1000 * 1000 * 100
    puts GC::Profiler.report
  end
end

DoWork.work
