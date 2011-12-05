class FolderExists < RuntimeError
  def message
    "Folder exists, can't create a fivetastic app here!"
  end
end

class Site
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def create!
    path = "#{Settings.sites_path}/#{@name}"
    
    check_not_exist path
    check_git
    
    create  
  end
  

  include Executable
  
  
  def create
    path = Settings.sites_path
    exec "cd #{path}; git clone git://github.com/makevoid/fivetastic.git #{@name}"
  end
  
  protected
  
  def check_git
    # TODO: do this
  end
  
  def check_not_exist(path)
    # TODO: handle this
    raise FolderExists if File.exists? path
  end
  
end