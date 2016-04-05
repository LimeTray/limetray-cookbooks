node[:deploy].each do |application, deploy|
  script "move" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}"
    code <<-EOH
    chmod -R 777 order-logs
    chmod -R 777 mysql_logs
    chmod -R 777 redis_logs 
    cp -r current/order-logs shared/
    cp -r current/mysql_logs shared/
    cp -r current/redis_logs shared/
    EOH
  end
end
