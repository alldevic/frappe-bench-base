echo "Create bench"
bench init --skip-redis-config-generation --frappe-branch version-14 frappe-bench
cd frappe-bench

echo "Config bench"
bench set-config -g db_host mariadb
bench set-config -g redis_cache redis://redis-cache:6379
bench set-config -g redis_queue redis://redis-queue:6379
bench set-config -g redis_socketio redis://redis-socketio:6379

echo "Creating site"
bench new-site mysite.localhost --mariadb-root-password 123 --admin-password admin --no-mariadb-socket

echo "Configuring site"
bench --site mysite.localhost set-config developer_mode 1
bench --site mysite.localhost clear-cache

echo "Get Wiki app"
bench get-app --branch version-14 https://github.com/frappe/wiki

echo "Installing Wiki app to mysite.localhost"
bench --site mysite.localhost install-app wiki