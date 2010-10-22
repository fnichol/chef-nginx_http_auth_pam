maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Installs ngx_http_auth_pam"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

recipe "nginx_http_auth_pam", "Installs ngx_http_auth_pam nginx module"

%w{ nginx }.each do |cb|
  depends cb
end

%w{ ubuntu }.each do |os|
  supports os
end

