

# Add your required timezone name here:
# If using JRuby with Trinidad, you must also modify the env.custom file with the desired timezone
# ex: add_java_option -Duser.timezone=UTC
timezone = "Asia/Calcutta"


service "sysklogd"

link "/etc/localtime" do
  to "/usr/share/zoneinfo/#{timezone}"
  # notifies :restart, resources(:service => [ "sysklogd"]), :delayed
  not_if "readlink /etc/localtime | grep -q '#{timezone}$'"
end