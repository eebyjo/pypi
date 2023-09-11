#!/bin/bash
set -e

# 用 gsutil 同步 GCS 上的 packages
gsutil rsync gs://$BUCKET_NAME /app/packages

PORT=${PORT:-8080}

# 啟動 pypiserver
# 從 Secret Manager 掛載的密碼檔案路徑為 /secrets/.htpasswd
exec pypi-server -p $PORT -a "download, list, update" -P /secrets/.htpasswd /app/packages