node[:deploy].each do |application, deploy|
bash 'web_builder_script' do
code <<-EOH
mkdir -p /tmp/test
EOH
end	
end
