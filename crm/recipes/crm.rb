node[:deploy].each do |application, deploy|
  script "crm" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}"
    code <<-EOH
    cd shared
    ln -sf /mnt/srv/www/limetraycms/ #{deploy[:deploy_to]}/current

    EOH
  end
end


