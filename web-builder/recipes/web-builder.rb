node[:deploy].each do |application, deploy|
  script "default" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}"
    code <<-EOH
    cp #{deploy[:deploy_to]} /mnt/srv/www/limetraycms/current
    EOH
  end
end


