node[:deploy].each do |application, deploy|
  script "limetraycms" do
    if application == 'limetraycms'
        interpreter "bash"
        user "root"
        cwd "#{deploy[:deploy_to]}"
        code <<-EOH
        if [ -d "/mnt/srv/www/web_builder/current" ]; then
            cp -r /mnt/srv/www/web_builder/current #{deploy[:deploy_to]}
        fi 
        EOH
    end
  end
end


