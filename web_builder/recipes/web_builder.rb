node[:deploy].each do |application, deploy|
  script "web_builder" do
    if application == 'web_builder'
	print node["deploy"]["appshortname"]["symlinks"]
	echo node["deploy"]["appshortname"]["symlinks"]
        interpreter "bash"
        user "root"
        cwd "#{deploy[:deploy_to]}"
        code <<-EOH
	mkdir -p /mnt/srv/www/limetraycms/current/web_builder/
        if [ -d "/mnt/srv/www/limetraycms/current" ]; then
            cp -r /mnt/srv/www/web_builder/current /mnt/srv/www/limetraycms/current/web_builder/
        fi
        EOH
    end
  end
end


