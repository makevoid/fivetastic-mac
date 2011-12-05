LOG = []

class AppDelegate
  attr_accessor :window
  
  attr_accessor :new_site_name
  attr_accessor :site_view
  attr_accessor :site_vc
  attr_accessor :sites_vc
  attr_accessor :console

  
  def applicationDidFinishLaunching(a_notification)
    site_view.hidden = true
    new_site_name.stringValue = "asd"
  end

  
  def create_site(sender)
    site_view.hidden = false
    site_name = new_site_name.stringValue

    site = Site.new site_name
    @site_vc.initz site
    @sites_vc.add site
  end
  
  def update_console
    @console.string = LOG.join("\n")
  end
  
end

