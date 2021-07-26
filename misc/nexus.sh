if docker volume ls | grep -q 'nexus-data'; then
   echo "volume exist not creating"
 else
   docker volume create nexus-data
fi
if ls -alh ~/ |grep -q 'nexus-data'; then
   echo "nexus-data at ~ exist, not creating"
 else
   mkdir ~/nexus-data && chmod 0777 ~/nexus-data
fi

echo "running nexus"

if ls -alh ~/ |grep -q 'nexus-data'; then
   echo "nexus-data at ~ exist, not creating"
 else
   mkdir ~/nexus-data && chmod 0777 ~/nexus-data
fi
docker run -d -p 8081:8081 --name nexus3 -v ~/nexus-data:/nexus-data sonatype/nexus3
docker start  nexus3
