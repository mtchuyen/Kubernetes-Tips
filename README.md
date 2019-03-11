# Kubernetes-Tips
Kubernetes Monitor

## Basic

### DaemonSet
DaemonSet cung cấp cách thức giúp miêu tả app hoạt động liên tục.

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

Đọc thêm về sự khác biệt của 2 trạng thái này ở [link](https://medium.com/@ltvpro/ph%C3%A2n-bi%E1%BB%87t-stateful-v%C3%A0-stateless-kh%C3%A1i-ni%E1%BB%87m-statefulset-trong-kubernetes-86c59e566bd0)

## Referrer:
- [Series về khái niệm K8s](http://blog.therightway.cloud/khai-niem-va-cac-thanh-phan-co-ban-trong-kubernetes-cluster/)
- https://techblog.vn/phan-2-kien-truc-cua-kubernetes
