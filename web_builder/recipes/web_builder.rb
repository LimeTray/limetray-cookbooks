node[:deploy].each do |application, deploy|
  script "web_builder" do
    if application == 'web_builder'
        interpreter "bash"
        user "root"
        cwd "#{deploy[:deploy_to]}"
        code <<-EOH
        if [ -d "/mnt/srv/www/limetraycms/current" ]; then
            cp -r #{deploy[:deploy_to]} /mnt/srv/www/limetraycms/current
        fi
        EOH
    end
  end
end


