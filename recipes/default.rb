#
# Cookbook Name:: nginx_http_auth_pam
# Based on rvm_passenger
# Recipe:: default
#
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
#
# Copyright:: 2010, Fletcher Nichol
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

version = node[:nginx_http_auth_pam][:version]
src_dir = "/tmp/ngx_http_auth_pam_module-#{version}" 

node[:nginx][:configure_flags].push(
  "--add-module=/tmp/ngx_http_auth_pam_module-1.1"
)

remote_file "/tmp/ngx_http_auth_pam_module-#{version}.tar.gz" do
  source "http://web.iti.upv.es/~sto/nginx/ngx_http_auth_pam_module-#{version}.tar.gz"
  action :create_if_missing
end

bash "compile_nginx_source" do
  cwd "/tmp"
  code <<-EOH
    tar zxf ngx_http_auth_pam_module-#{version}.tar.gz
  EOH
  creates src_dir
end

include_recipe "nginx::source"
