#!/usr/bin/dumb-init /bin/bash

echo
echo '______  __        __         ______         _______   __    __  ______  __        _______   ________  _______     '
echo '/      |/  |      /  |       /      \       /       \ /  |  /  |/      |/  |      /       \ /        |/       \   '
echo '$$$$$$/ $$ |      $$ |      /$$$$$$  |      $$$$$$$  |$$ |  $$ |$$$$$$/ $$ |      $$$$$$$  |$$$$$$$$/ $$$$$$$  |  '
echo '  $$ |  $$ |      $$ |      $$ |__$$ |      $$ |__$$ |$$ |  $$ |  $$ |  $$ |      $$ |  $$ |$$ |__    $$ |__$$ |  '
echo '  $$ |  $$ |      $$ |      $$    $$ |      $$    $$< $$ |  $$ |  $$ |  $$ |      $$ |  $$ |$$    |   $$    $$<   '
echo '  $$ |  $$ |      $$ |      $$$$$$$$ |      $$$$$$$  |$$ |  $$ |  $$ |  $$ |      $$ |  $$ |$$$$$/    $$$$$$$  |  '
echo ' _$$ |_ $$ |_____ $$ |_____ $$ |  $$ |      $$ |__$$ |$$ \__$$ | _$$ |_ $$ |_____ $$ |__$$ |$$ |_____ $$ |  $$ |  '
echo '/ $$   |$$       |$$       |$$ |  $$ |      $$    $$/ $$    $$/ / $$   |$$       |$$    $$/ $$       |$$ |  $$ |  '
echo '$$$$$$/ $$$$$$$$/ $$$$$$$$/ $$/   $$/       $$$$$$$/   $$$$$$/  $$$$$$/ $$$$$$$$/ $$$$$$$/  $$$$$$$$/ $$/   $$/   '
echo                                                                                                            

# default config
export PGDATA=/opt/illa/database/pgdata 
export MINIODATA=/opt/illa/drive/

# dump config
echo 
echo 'postgres database files are in: '$PGDATA
echo 'minio storage files are in: '$MINIODATA

# init
echo
echo '[init]'
echo
current_user="$(id -u)"
/opt/illa/config-init.sh

# run entrypoint files
echo
echo '[run entrypoint files]'
echo
/opt/illa/database/postgres-entrypoint.sh 
/opt/illa/redis/redis-entrypoint.sh 
/opt/illa/minio/minio-entrypoint.sh 
/opt/illa/envoy/envoy-entrypoint.sh

# run postgres
echo
echo '[run postgres]'
echo
gosu postgres postgres & 


# run redis
echo
echo '[run redis]'
echo
gosu redis redis-server & 

# run minio
echo
echo '[run minio]'
echo
gosu minio /usr/local/bin/minio server $MINIODATA &

# init data
echo
echo '[init data]'
echo
/opt/illa/database/postgres-init.sh 

# run illa units
echo
echo '[run illa units]'
echo
/opt/illa/illa-builder-backend/bin/illa-builder-backend &
/opt/illa/illa-builder-backend/bin/illa-builder-backend-ws &
/opt/illa/illa-supervisor-backend/bin/illa-supervisor-backend &
/opt/illa/illa-supervisor-backend/bin/illa-supervisor-backend-internal &

# run ingress and gateway
echo
echo '[run ingress and gateway]'
echo
gosu nginx nginx &
/usr/local/bin/envoy -c /opt/illa/envoy/illa-unit-ingress.yaml &


# post init
echo
echo '[post init]'
echo
/opt/illa/post-init.sh

# loop
while true; do
    sleep 1;
done
