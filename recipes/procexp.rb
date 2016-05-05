directory node['sysinternals']['install_dir'] do
  action :create
end

exe=::File.join(node['sysinternals']['install_dir'],::File.basename(node['sysinternals']['procexp']['url']))
remote_file exe do
  source node['sysinternals']['procexp']['url']
  not_if {::File.exists? exe}
end

# Accept the EULA
registry_key "HKEY_CURRENT_USER\\Software\\Sysinternals\\#{node['sysinternals']['procexp']['name']}" do
  values [{
    :name => 'EulaAccepted',
    :type => :dword,
    :data => 1
  }]
  action :create
  recursive true
end

# Replace taskmgr.exe
registry_key "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\taskmgr.exe" do
  values [{
    :name => 'Debugger',
    :type => :string,
    :data => exe
  }]
  action node['sysinternals']['procexp']['replace_taskmgr'] ? :create : :delete
  recursive true
end