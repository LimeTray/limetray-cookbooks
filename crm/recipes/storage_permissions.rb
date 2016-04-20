node[:deploy].each do |application, deploy|
  script "storage_permissions" do
  	Chef::Log.info(application)
	interpreter "bash"
	user "root"
	cwd "#{deploy[:deploy_to]}/current"
	code <<-EOH
	chmod -R 777 app/storage/ 
	EOH

  end
end


