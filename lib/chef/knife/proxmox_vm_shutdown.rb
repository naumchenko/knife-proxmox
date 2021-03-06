require 'chef/knife/proxmox_base'


class Chef
  class Knife
    class ProxmoxVmShutdown < Knife

      include Knife::ProxmoxBase

      banner "knife proxmox vm shutdown (options)"

      option :vmid,
        :short => "-I ID",
        :long  => "--vmid ID",
        :description => "The numeric identifier of the VM"
      
      def run
        connection
        
        [:vmid].each do |param|
          check_config_parameter(param)
        end

        vm_shutdown(config[:vmid])
        
      end
    end
  end
end
