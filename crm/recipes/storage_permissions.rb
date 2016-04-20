node[:deploy].each do |application, deploy|
  Chef::Log.info(node[:deploy][:application_name])
  script "storage_permissions" do
  	Chef::Log.info(node[:deploy][:application_name])
	# interpreter "bash"
	# user "root"
	# cwd "#{deploy[:deploy_to]}/current"
	# code <<-EOH
	# chmod -R 777 app/storage/ 
	# EOH

  end
end


