#
# Cookbook:: sysinternals
# Recipe:: full_suite
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
version = if node['sysinternals']['full_suite']['checksum'].nil?
            'no_version'
          else
            @node['sysinternals']['full_suite']['checksum'].to_s
          end

node.default['sysinternals']['install_dir_version'] = "#{node['sysinternals']['install_dir_full']}-#{version}"

directory node['sysinternals']['install_dir_version'] do
  action :create
end

archive_file node['sysinternals']['install_dir_version'] do
  action :unzip
  source node['sysinternals']['full_suite']['url']
  checksum node['sysinternals']['full_suite']['checksum'] unless node['sysinternals']['full_suite']['checksum'].nil?
  not_if { ::File.exist?(::File.join(node['sysinternals']['install_dir'], 'PsExec.exe')) }
  notifies :create, "link[@node['sysinternals']['install_dir_version'].to_s]", :immediately
end

link @node['sysinternals']['install_dir_version'].to_s do
  to @node['sysinternals']['install_dir_full'].to_s
  action :nothing
end

windows_path node['sysinternals']['install_dir_full']
