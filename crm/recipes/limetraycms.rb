node[:deploy].each do |application, deploy|
  script "limetraycms" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}"
    code <<-EOH
    cd shared
    ln -sf #{deploy[:deploy_to]}/current /mnt/srv/www/limetraycms/current
    EOH
  end
end


