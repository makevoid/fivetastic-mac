class SitesVC
  
  def initialize
    @sites = []
  end
  
  def add(site)
    @sites << site
  end
  
  def create
    path = Settings.sites_path
  end
  
end