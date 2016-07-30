# Encoding: utf-8
# Cookbook Name:: auditd
# Provider:: auditd_ruleset
#
# Copyright 2012, Heavy Water Operations, LLC.
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

# provider for installing audit rules from a template
action :create do
  # add centos support without changing others
  rule_file = case node['platform']
  when 'centos'
    '/etc/audit/rules.d/audit.rules'
  else
    '/etc/audit/audit.rules'
  end

  template rule_file do
    source "#{new_resource.name}.erb"
    cookbook new_resource.cookbook if new_resource.cookbook
    notifies :restart, resources(service: 'auditd')
  end
end
