node[:deploy].each do |application, deploy|
  script "default" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}"
    code <<-EOH
    cd shared
    mkdir order-logs mysql_logs redis_logs
    chmod -R 777 order-logs mysql_logs redis_logs
    ln -s #{deploy[:deploy_to]}/shared/order-logs #{deploy[:deploy_to]}/current/order-logs
    ln -s #{deploy[:deploy_to]}/shared/mysql_logs #{deploy[:deploy_to]}/current/mysql_logs
    ln -s #{deploy[:deploy_to]}/shared/redis_logs #{deploy[:deploy_to]}/current/redis_logs
    chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/order-logs
    chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/mysql_logs
    chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/redis_logs
    EOH
  end
end


