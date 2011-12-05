module Executable
  def exec(cmd)
    puts "executing: #{cmd}"
    out = `#{cmd}`
    puts out
    macruby_log out
    out 
  end
  
  def macruby_log(str)
    LOG << str
    app = NSApplication.sharedApplication
    app.delegate.update_console
  end
end