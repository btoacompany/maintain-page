---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: maintain-prod # can filter by docker filter
  namespace: be-prod
  labels:
    app: maintain-prod
spec:
  replicas: 1
  selector:
    matchLabels:
      app: maintain-prod
  template:
    metadata:
      labels:
        app: maintain-prod
    spec:
      containers:
      - name: maintain-prod
        image: asia-northeast1-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/be/maintain-page:COMMIT_SHA
        ports:
        - containerPort: 80
        readinessProbe:
          httpGet:
            path: /
            port: 80
