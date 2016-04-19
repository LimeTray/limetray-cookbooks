node[:deploy].each do |application, deploy|
bash 'copy_web_builder' do
code <<-EOH
mkdir -p /mnt/srv/www/limetraycms/current/web_builder/
rm -rf /mnt/srv/www/limetraycms/current/web_builder/*
cp -r /mnt/srv/www/web_builder/current/* /mnt/srv/www/limetraycms/current/web_builder/
chown -R #{deploy[:user]}:#{deploy[:group]} /mnt/srv/www/limetraycms/current/web_builder/
EOH
end
end
