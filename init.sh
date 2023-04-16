echo "Create bench"
bench init --skip-redis-config-generation --frappe-branch version-14 ${FRAPPE_PREFIX}-bench
cd ${FRAPPE_PREFIX}-bench

echo "Config bench"
bench set-config -g db_host mariadb
bench set-config -g redis_cache redis://redis-cache:6379
bench set-config -g redis_queue redis://redis-queue:6379
bench set-config -g redis_socketio redis://redis-socketio:6379

echo "Creating site"
bench new-site ${FRAPPE_PREFIX}.localhost --mariadb-root-password ${MARIADB_ROOT_PASSWORD} --admin-password ${ADMINISTRATOR_PASSWORD} --no-mariadb-socket

echo "Configuring site"
bench --site ${FRAPPE_PREFIX}.localhost set-config developer_mode 1
bench --site ${FRAPPE_PREFIX}.localhost clear-cache
bench --site ${FRAPPE_PREFIX}.localhost add-to-hosts
bench add-system-manager --password ${SYSTEM_MANAGER_PASSWORD} ${SYSTEM_MANAGER_NAME}
bench use ${FRAPPE_PREFIX}.localhost

echo "Create app"
bench new-app --no-git ${FRAPPE_PREFIX}-app

echo "Installing app to site"
bench --site ${FRAPPE_PREFIX}.localhost install-app ${FRAPPE_PREFIX}-app

echo "Done!"
