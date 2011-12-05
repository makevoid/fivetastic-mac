class Settings

  @@sites_path = "#{ENV['HOME']}/Sites"
  
  def self.sites_path
    @@sites_path
  end
  
  def self.site_path(site)
    "#{@@sites_path}/#{site.name}"
  end
  
end