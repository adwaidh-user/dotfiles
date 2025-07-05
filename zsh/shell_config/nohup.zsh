function nohup() {
	mkdir -p ~/nohup_log
	logfile=~/nohup_log/nohup_$(date +%Y-%m-%d).log
	command nohup "$@" >> "$logfile" 2>&1 &
}

