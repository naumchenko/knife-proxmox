require 'chef/knife/proxmox_base'


class Chef
  class Knife
    class ProxmoxServerStart < Knife

      include Knife::ProxmoxBase

      banner "knife proxmox server start (options)"

      option :vm_id,
        :short => "-I number",
        :long  => "--vmid number",
        :description => "The numeric identifier of the VM"

      option :pve_vm_type,
        :short => "-t type",
        :long  => "--type vm type",
        :description => "The type of vm you want to control (qemu or openvz)"

      def run
        # Needed
        connection
        
        check_config_parameter(:vm_id)
        check_config_parameter(:pve_vm_type)
        
        server_start(config[:vm_id], config[:pve_vm_type])
      end
    end
  end
end