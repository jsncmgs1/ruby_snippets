#Credit to Alexander Dymo in 'Ruby Performance Optimization'

module DoWork
  def self.work
    before_count = GC.stat[:count]
    x = 'x' * 1024 * 1024 * 1000 # Allocate 100 MB of memory
    y = 'x' * 1024 * 1024 * 1000 # Allocate 100 MB of memory
    after_count = GC.stat[:count]
    puts "Before count: #{before_count}"
    puts "After count: #{after_count}"
  end
end

DoWork.work
