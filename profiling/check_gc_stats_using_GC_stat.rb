#Credit to Alexander Dymo in 'Ruby Performance Optimization'

module DoWork
  def self.work
    before = GC.stat
    x = 'x' * 1024 * 1024 * 1000 # Allocate 100 MB of memory
    y = 'x' * 1024 * 1024 * 1000 # Allocate 100 MB of memory
    after = GC.stat
    puts "Before count: #{before}"
    puts "After count: #{after}"
  end
end

DoWork.work
