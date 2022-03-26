
# Script to Check Kubernetes API Server status

I was studying kubernetes for the CKA exam and found some Api Server endpoints which made me create this script.

```bash
curl -k --silent "https://$API_SERVER:6443/readyz?&exclude=etcd
```
The Kubernetes will make a health check in the Kubernetes Api and Return "ok" if it's all right.

You can also use the following curl to view in verbose mode:

```bash
curl -k -silent 'https://$API_SERVER:6443/readyz?verbose&exclude=etcd'

```

```bash
[+]ping ok
[+]log ok
[+]etcd excluded: ok
[+]poststarthook/start-kube-apiserver-admission-initializer ok
[+]poststarthook/generic-apiserver-start-informers ok
[+]poststarthook/start-apiextensions-informers ok
[+]poststarthook/start-apiextensions-controllers ok
[+]poststarthook/crd-informer-synced ok
[+]poststarthook/bootstrap-controller ok
[+]poststarthook/rbac/bootstrap-roles ok
[+]poststarthook/scheduling/bootstrap-system-priority-classes ok
[+]poststarthook/start-cluster-authentication-info-controller ok
[+]poststarthook/start-kube-aggregator-informers ok
[+]poststarthook/apiservice-registration-controller ok
[+]poststarthook/apiservice-status-available-controller ok
[+]poststarthook/kube-apiserver-autoregistration ok
[+]autoregister-completion ok
[+]poststarthook/apiservice-openapi-controller ok
[+]shutdown ok
healthz check passed
```

