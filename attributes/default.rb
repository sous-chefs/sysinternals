#
# Cookbook:: sysinternals
# Attributes:: default
#
# Copyright:: 2013-2017, Chef Software, Inc.
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

default['sysinternals']['install_dir'] = 'C:/Program Files/SysInternals'
default['sysinternals']['tools'] = {
  'AccessEnum' => 'http://live.sysinternals.com/AccessEnum.exe',
  'ADExplorer' => 'http://live.sysinternals.com/ADExplorer.exe',
  'ADInsight' => 'http://live.sysinternals.com/adinsight.exe',
  'Autologon' => 'http://live.sysinternals.com/Autologon.exe',
  'Autoruns' => 'http://live.sysinternals.com/autoruns.exe',
  'BGInfo' => 'http://live.sysinternals.com/Bginfo.exe',
  'Process Monitor' => 'http://live.sysinternals.com/Procmon.exe',
}

default['sysinternals']['procexp']['name'] = 'Process Explorer'
default['sysinternals']['procexp']['url'] =  'http://live.sysinternals.com/procexp.exe'
default['sysinternals']['procexp']['replace_taskmgr'] = true

default['sysinternals']['full_suite']['url']      = 'http://download.sysinternals.com/files/SysinternalsSuite.zip'
default['sysinternals']['full_suite']['checksum'] = nil
