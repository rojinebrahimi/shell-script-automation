timestamp=$(date +%d-%m-%Y_%H-%M-%S)
supervisorctl start worker-1 worker-2
sleep 2
if supervisorctl status worker-1 | grep RUNNING; then
  echo $timestamp "- Worker-1 started successfully!" >> /var/log/cron.log
fi

if supervisorctl status worker-2 | grep RUNNING; then
  echo $timestamp "- Worker-2 started successfully!" >> /var/log/cron.log
fi
