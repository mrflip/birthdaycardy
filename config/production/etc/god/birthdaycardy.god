require 'godhead'
BIRTHDAYCARDY_DEPLOY_DIR = '/var/www/birthdaycardy'

# ===========================================================================
#
# Birthdaycardy web app
#
group_options = { :monitor_group => :birthdaycardy, }

# Use NginxRunnerRecipe on OSX
Godhead::NginxRecipe.create group_options.merge({ })
# Godhead::NginxRunnerRecipe.create group_options.merge({ })

Godhead::UnicornRecipe.create     group_options.merge({
    :root_dir => BIRTHDAYCARDY_DEPLOY_DIR+'/current',
    :pid_file => BIRTHDAYCARDY_DEPLOY_DIR+'/shared/tmp/unicorn.pid',
    :uid      => 'www-data'
  })
