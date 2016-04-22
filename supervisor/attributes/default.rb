#
# Cookbook Name:: supervisor
# Attributes:: default
#
# Copyright 2012-2013, Escape Studios
#

default['supervisor']['programs'] = {
    "limetray" => {
        "name" => "limetray-worker",
        "command" => "/usr/bin/php /srv/www/project/current/artisan queue:listen --queue=whatever_it_is --timeout=240 --tries=3",
        "stdout_logfile" => "/mnt/srv/www/limetray-worker.log",
        "autostart" => true,
        "autorestart" => true,
        "user" => "apache",
        "numprocs" => 5
    }
}

default['supervisor']['sockfile'] = "/var/run/supervisor.sock"
