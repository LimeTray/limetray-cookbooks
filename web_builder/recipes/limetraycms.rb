node[:deploy].each do |application, deploy|
  script "limetraycms" do
    if application == 'limetraycms'
        interpreter "bash"
        user "root"
        cwd "#{deploy[:deploy_to]}"
    end
  end
end
