#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

directory node['sysinternals']['install_dir'] do
  action :create
end

exe = ::File.join(node['sysinternals']['install_dir'], ::File.basename(node['sysinternals']['procexp']['url']))
remote_file exe do
  source node['sysinternals']['procexp']['url']
  not_if { ::File.exist? exe }
end

# Accept the EULA
registry_key "HKEY_CURRENT_USER\\Software\\Sysinternals\\#{node['sysinternals']['procexp']['name']}" do
  values [{
    name: 'EulaAccepted',
    type: :dword,
    data: 1,
  }]
  action :create
  recursive true
end

# Replace taskmgr.exe
registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Image File Execution Options\\taskmgr.exe' do
  values [{
    name: 'Debugger',
    type: :string,
    data: exe,
  }]
  action node['sysinternals']['procexp']['replace_taskmgr'] ? :create : :delete
  recursive true
end
