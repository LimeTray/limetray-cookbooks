node[:deploy].each do |application, deploy|
  script "default" do
  	if application == 'web-builder'
	    interpreter "bash"
	    user "root"
	    cwd "#{deploy[:deploy_to]}"
	    code <<-EOH
	    if [ -d "/mnt/srv/www/limetraycms/current" ]; then
	    	cp #{deploy[:deploy_to]} /mnt/srv/www/limetraycms/current
	    fi
	    EOH
	end
  end
end


