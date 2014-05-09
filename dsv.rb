require 'active_record'
require 'net/ping'

class DsvSystem < ActiveRecord::Base
  has_many :dsv_nodes
  has_many :dsv_subnets
end

class DsvSubnet < ActiveRecord::Base
#  has_many :dsv_nodes
  has_many :dsv_ifs
  belongs_to :dsv_system, :dependent => :destroy
  

end

class DsvNode < ActiveRecord::Base
  belongs_to :dsv_system, :dependent => :destroy
  has_many :dsv_apls
  has_many :dsv_ifs
#  attr_accessible :name, :dsv_if_ids

  def if_reachable
    addr = self.dsv_ifs[0].ipaddr
    pinger = Net::Ping::External.new(addr)
    
    if pinger.ping?
      return true
    else
      return false
    end
  end

  def copy_log_to(file, dest)
    
  end
  
  def monitor_xxx(file)
    
  end
  
  def exec_on_node(name, script_file)
    
  end
  
end

class DsvApl < ActiveRecord::Base
  belongs_to :dsv_node, :dependent => :destroy
end

class DsvRole < ActiveRecord::Base

end

class DsvIf < ActiveRecord::Base
  belongs_to :dsv_node, :dependent => :destroy
  belongs_to :dsv_subnet
end

class SystemCtrlCliState < ActiveRecord::Base
end


