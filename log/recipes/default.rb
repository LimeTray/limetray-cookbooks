node[:deploy].each do |application, deploy|
  script "default" do
    if deploy[:application_type] != 'php'
        Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
        next
    end
    if application == 'limetraycms'
        interpreter "bash"
        user "root"
        cwd "#{deploy[:deploy_to]}"
        code <<-EOH
        cd shared
        mkdir -p order-logs mysql_logs redis_logs logs/error
        chmod -R 777 order-logs mysql_logs redis_logs logs
        ln -s #{deploy[:deploy_to]}/shared/order-logs #{deploy[:deploy_to]}/current/order-logs
        ln -s #{deploy[:deploy_to]}/shared/mysql_logs #{deploy[:deploy_to]}/current/mysql_logs
        ln -s #{deploy[:deploy_to]}/shared/redis_logs #{deploy[:deploy_to]}/current/redis_logs
        ln -s #{deploy[:deploy_to]}/shared/logs #{deploy[:deploy_to]}/current/logs
        chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/order-logs
        chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/mysql_logs
        chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/redis_logs
        chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/logs
        EOH
    end
  end
end


