node[:deploy].each do |application, deploy|
bash 'extract_module' do
code <<-EOH
mkdir -p /tmp/test
EOH
end	
end
