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
  
end