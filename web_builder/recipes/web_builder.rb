node[:deploy].each do |application, deploy|
  script "web_builder" do
    if application == 'web_builder'
        interpreter "bash"
        user "root"
        cwd "#{deploy[:deploy_to]}"
    end
  end
end


