include Dispatch
class Future
  def initialize(&block)
    # Each thread gets its own FIFO queue upon which we will dispatch
    # the delayed computation passed in the &block variable.
    Thread.current[:futures] ||= Queue.new("org.macruby.futures-#{Thread.current.object_id}")
    @group = Group.new
    # Asynchronously dispatch the future to the thread-local queue.
    Thread.current[:futures].async(@group) { @value = block.call }
  end
  def value
    # Wait for the computation to finish. If it has already finished, then
    # just return the value in question.
    @group.wait
    @value
  end
end

class Server
  def initialize(site)
    @site = site
  end
  
  include Executable
  
  def start!
    path = Settings.site_path @site
    #exec "cd #{path}; /usr/local/bin/bundle install"
    
    cmd = "/usr/local/bin/ruby /usr/local/bin/rackup -p 3000 -o 0.0.0.0"
    
    val = exec "ps ax | grep \"#{cmd}\""
    proc = val.split("\n")[1].match(/^\d+/)[0].to_i
    exec "sudo kill -9 #{proc}"
    
    Future.new do
      exec "cd #{path}; #{cmd}"
    end
  end
  
  def setup!
    # TODO: hook
    exec "/usr/local/bin/gem install bundler"
    exec "cd #{path}; /usr/local/bin/bundle"
  end
  
end