# docker-hostname
Simple NGINX web server which the service page  contains the hostname, IP address, and path from request


Simplified version (nginxdemos/hello)[https://hub.docker.com/r/nginxdemos/hello] with updated NGINX

## Usage

in Docker
```bash
docker run --rm -d -p 8080 orginux/docker-hostname:1.0
```

in Kubernetes

Create Deployment
```bash
export DEPLOY_NAME="example"
kubectl create deployment $DEPLOY_NAME --image=orginux/docker-hostname
```

Create Service
```bash
kubectl expose deployment $DEPLOY_NAME --name ${DEPLOY_NAME}-service --target-port 80 --port 80
```

Add rule Ingress
```yaml
spec:
  rules:
    - host: my-cluster.name
      http:
        paths:
          - path: /debug
            backend:
              serviceName: example-service
              servicePort: 80
```

Get content
```
$ curl http://my-cluster.name/debug

    Server address: 10.233.65.78:80
    Server name: example-856796c6dd-k6rch
    Date: 18/Oct/2020:14:59:45 +0000
    URI: /debug
    Request ID: 54baa211f55997cc568679e65f41c8d3
```
