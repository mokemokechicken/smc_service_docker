cd /application
git clone https://github.com/mokemokechicken/smcwebservice.git

cd smcwebservice
./activator clean compile stage

# port 9000

cat <<EOF > /etc/supervisord.d/play.conf
[program:smcwebservice]
command=/application/smcwebservice/target/universal/stage/bin/hello-play
numprocs=1
autostart=true
autorestart=true
redirect_stderr=true
stdout_logfile=/var/log/smcwebservice.log
EOF
