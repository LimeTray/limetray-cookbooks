node[:deploy].each do |application, deploy|
  Chef::Log.info(node[:deploy][:application_name])
  script "storage_permissions" do
	interpreter "bash"
	user "root"
	cwd "#{deploy[:deploy_to]}/current"
	code <<-EOH
	if [ -d "app/storage/" ]; then
		chmod -R 777 app/storage/ 
	fi
	EOH

  end
end


