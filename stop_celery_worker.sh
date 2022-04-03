timestamp=$(date +%d-%m-%Y_%H-%M-%S)
supervisorctl stop worker-1 worker-2
sleep 2
if supervisorctl status worker-1 | grep STOPPED; then
  echo $timestamp "- Worker-1 stopped successfully!" >> /var/log/cron.log
fi

if supervisorctl status worker-2 | grep STOPPED; then
  echo $timestamp "- Worker-2 stopped successfully!" >> /var/log/cron.log
fi
