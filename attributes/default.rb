default[:nginx_http_auth_pam][:version] = "1.1"
default[:nginx][:configure_flags] = node[:nginx][:configure_flags].push(
  "--add-module=/tmp/ngx_http_auth_pam_module-1.1"
)

