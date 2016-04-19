node[:deploy].each do |application, deploy|
  script "storage_permissions" do
  	if application == 'crm' || application == 'campaign'
		interpreter "bash"
		user "root"
		cwd "#{deploy[:deploy_to]}/current"
		code <<-EOH
		chmod -R 777 app/storage/ 
		EOH
	end
  end
end


