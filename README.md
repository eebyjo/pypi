# pypi

一個簡單的 pypiserver 服務，預設使用 Cloud RUN 啟動

- 掛載 Secret Manager 的密鑰，實現基本權限控制
- 冷啟動時同步 GCS 值區中的 packages，保持資料的最新和一致性

需要為服務帳戶新增 `Secret Manager Secret Accessor` Role