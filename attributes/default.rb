# Encoding: utf-8
# Cookbook Name:: auditd
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

default['auditd']['ruleset'] = 'default.rules'
default['auditd']['backlog'] = 320

default['auditd']['conf'] = {
	'log_file' => '/var/log/audit/audit.log',
	'log_format' => 'RAW',
	'log_group' => 'root',
	'priority_boost' => '4',
	'flush' => 'INCREMENTAL',
	'freq' => '20',
	'num_logs' => '5',
	'disp_qos' => 'lossy',
	'dispatcher' => '/sbin/audispd',
	'name_format' => 'NONE',
	'max_log_file' => '6',
	'max_log_file_action' => 'ROTATE',
	'space_left' => '75',
	'space_left_action' => 'SYSLOG',
	'action_mail_acct' => 'root',
	'admin_space_left' => '50',
	'admin_space_left_action' => 'SUSPEND',
	'disk_full_action' => 'SUSPEND',
	'disk_error_action' => 'SUSPEND',
	'tcp_listen_queue' => '5',
	'tcp_max_per_addr' => '1',
	'tcp_client_max_idle' => '0',
	'enable_krb5' => 'no',
	'krb5_principal' => 'auditd'
}
