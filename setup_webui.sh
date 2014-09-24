cd /application
git clone https://github.com/mokemokechicken/GoodParts.git

cd GoodParts
git submodule update --init

export HOME=/root

source ~/.rbenv/rbenv.sh
rbenv local 2.0.0-p576
bundle install --path vendor/bundle

export RAILS_ENV=production
bundle exec rake db:migrate
bundle exec rake assets:precompile

cat <<'EOF' > run_server.sh
#!/bin/sh

cd $(dirname $0)

export HOME=/root
source ~/.rbenv/rbenv.sh

bundle exec puma -p 8000 -t 8:32 -e production
EOF

chmod +x run_server.sh


cat <<EOF > /etc/supervisord.d/rails.conf
[program:webui]
command=/application/GoodParts/run_server.sh
numprocs=1
autostart=true
autorestart=true
redirect_stderr=true
stdout_logfile=/var/log/webui.log
EOF
