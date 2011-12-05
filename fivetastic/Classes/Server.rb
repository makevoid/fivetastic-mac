class Server
  def initialize(site)
    @site = site
  end
  
  include Executable
  
  def start!
    path = Settings.site_path @site
    exec "cd #{path}; rackup"
  end
  
  def setup!
    # TODO: hook
    exec "gem install bundle"
    exec "bundle"
  end
  
end