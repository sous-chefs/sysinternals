#
# Cookbook:: sysinternals
# Recipe:: default
#
# Copyright:: 2013-2019, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cache_dir = File.join(Chef::Config[:file_cache_path], 'sysinternals')

directory cache_dir do
  action :create
end

directory node['sysinternals']['install_dir'] do
  action :create
end

node['sysinternals']['tools'].each do |toolname, url|
  exe = ::File.join(node['sysinternals']['install_dir'], ::File.basename(url))
  remote_file exe do
    source url
    action :create_if_missing
  end
  # disable popup, we accept the EULA!
  # http://peter.hahndorf.eu/blog/2010/03/07/WorkAroundSysinternalsLicensePopups.aspx
  registry_key "HKEY_CURRENT_USER\\Software\\Sysinternals\\#{toolname}" do
    values [{
      name: 'EulaAccepted',
      type: :dword,
      data: 1,
    }]
    action :create
    recursive true
  end
end
