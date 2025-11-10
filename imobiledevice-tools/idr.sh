cd /data/ipsw
idevicerestore -l -e -y
cd /data/github-repos
echo "waiting for phone....."
sleep 2m
./battery_health.sh
ideviceactivation activate



