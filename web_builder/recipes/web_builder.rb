node[:deploy].each do |application, deploy|
if application == 'web_builder'
bash 'web_builder_script' do
code <<-EOH
mkdir -p /tmp/test
EOH
end	
end
