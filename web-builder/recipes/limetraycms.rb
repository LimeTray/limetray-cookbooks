node[:deploy].each do |application, deploy|
  script "default" do
  	if application == 'limetraycms'
	    interpreter "bash"
	    user "root"
	    cwd "#{deploy[:deploy_to]}"
	    code <<-EOH
	    cp /mnt/srv/www/web-builder/current #{deploy[:deploy_to]} 
	    EOH
	end
  end
end


