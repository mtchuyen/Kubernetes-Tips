# Kubernetes-Tips
Kubernetes Monitor

## Basic

### Deployment:
Là cách quản lý 1 pod (container) được tạo ra:
- Số pod: `replicas: 3`
- Mô hình mạng: `hostNetwork: true`
- Chạy trên Node nào: `nodeSelector:...`
- Nơi lấy images:
- Trạng thái pod: nếu pod die thì xử lý như nào
- Config cho chương trình chạy trong pods
- Các xử lý khác

### State
Có 2 trạng thái:
- StatefulSets: dùng khi xóa pod đi nhưng vẫn giữ lại dữ liệu.
- Stateless:
