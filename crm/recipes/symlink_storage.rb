node[:deploy].each do |application, deploy|
  script "symlink_storage" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}"
    code <<-EOH
    if [ -d "current/app/storage" ]; then
    	chmod -R 777 current/app/storage
        mv current/app/storage/* shared
        rm -rf current/storage
        ln -s #{deploy[:deploy_to]}/shared #{deploy[:deploy_to]}/current/app/storage
        chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/app/storage
    fi
    EOH
  end
end


