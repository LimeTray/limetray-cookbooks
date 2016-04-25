node[:deploy].each do |application, deploy|
  script "default" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}"
    code <<-EOH
    if [ -f "current/lib/common.functions.php" ]; then
    	cd shared
	    mkdir -p order-logs mysql_logs redis_logs logs/error logs/error/mb_logs logs/error/mb_er_logs
	    chmod -R 777 order-logs mysql_logs redis_logs logs
	    ln -s #{deploy[:deploy_to]}/shared/order-logs #{deploy[:deploy_to]}/current/order-logs
	    ln -s #{deploy[:deploy_to]}/shared/mysql_logs #{deploy[:deploy_to]}/current/mysql_logs
	    ln -s #{deploy[:deploy_to]}/shared/redis_logs #{deploy[:deploy_to]}/current/redis_logs
	    ln -s #{deploy[:deploy_to]}/shared/logs/error #{deploy[:deploy_to]}/current/logs/error
	    chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/order-logs
	    chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/mysql_logs
	    chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/redis_logs
	    chown -h #{deploy[:user]}:#{deploy[:group]} #{deploy[:deploy_to]}/current/logs/error
    fi 
    EOH
  end
end