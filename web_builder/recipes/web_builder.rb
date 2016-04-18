node[:deploy].each do |application, deploy|
bash 'copy_limetraycms_script' do
code <<-EOH
cp -r /mnt/srv/www/limetraycms/current/* /mnt/srv/www/web_builder/current/
chown -R #{deploy[:user]}:#{deploy[:group]} /mnt/srv/www/web_builder/current/
EOH
end	
end
