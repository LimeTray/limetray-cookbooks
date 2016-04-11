node[:deploy].each do |application, deploy|
  script "default" do
  	if application == 'limetraycms'
	    interpreter "bash"
	    user "root"
	    cwd "#{deploy[:deploy_to]}"
	    code <<-EOH
	    if [ -d "/mnt/srv/www/web-builder/current" ]; then
	    	cp /mnt/srv/www/web-builder/current #{deploy[:deploy_to]}
	    fi 
	    EOH
	end
  end
end


