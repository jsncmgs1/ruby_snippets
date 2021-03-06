# `ps -o rss= -p #{Process.pid}`.to_i/1024
#
# checks the memory use of a process
# credit to Alexander Dymo - Ruby Performance Optimization

module DoWork
  def self.work
    puts "Before work: "
    puts "#{`ps -o rss= -p #{Process.pid}`.to_i/1024} MB "

    GC.disable
    Array.new(100) { "x" * 1024 * 1024 }
    puts "After Work: "
    puts "#{`ps -o rss= -p #{Process.pid}`.to_i/1024} MB"
    GC.enable
  end
end

DoWork.work
