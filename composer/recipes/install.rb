node[:deploy].each do |application, deploy|
  script "install_composer" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    curl -s https://getcomposer.org/installer | php
    echo -e "{\"github-oauth\":{\"github.com\": \"5a6c445f1f2e7be54c4b90f8fb37e9f7261ce1a5\" }}" > /root/.composer/auth.json
    php composer.phar install --no-dev --no-interaction --prefer-dist
    EOH
    only_if { ::File.exist?("#{deploy[:deploy_to]}/current/composer.json")}
  end
end