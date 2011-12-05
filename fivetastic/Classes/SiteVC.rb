class SiteVC

  attr_accessor :name_label

  def initz(site)
    @site = site
    self.name_label.stringValue = @site.name
    @site.create!
  end
  
  def server_start(sender)
    server = Server.new @site
    server.start!
  end
  
  include Executable
  
  def preview(sender)
    exec "open http://localhost:3000"
  end
  
  def edit(sender)
    path = Settings.site_path @site
    exec "cd #{path}; /usr/local/bin/mate ."
  end
  
end