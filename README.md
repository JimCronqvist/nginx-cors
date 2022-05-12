# Nginx Cors

A docker container running a Nginx reverse proxy to solve CORS problems on local development, when you can't use webpack/vite to proxy the requests through there.

If you can use webpack/vite, it is recommended to do so instead. See: https://vitejs.dev/config/#server-proxy

This is different from many other solutions that usually require you to change the format of the URL, this one aims to keep the exising format without needing to change any code. 

With the following example:

```
version: '3.9'
services:
  api:
    container_name: api
    image: ghcr.io/jimcronqvist/nginx-cors:master
    restart: unless-stopped
    environment:
      - UPSTREAM=https://api.domain.com
    labels:
      - traefik.enable=true
      - traefik.http.routers.api-proxy.rule=PathPrefix(`/api`)
```

A URL locally that goes to for example http://localhost:3000/api/users will be proxied to https://api.domain.com/api/users and avoid the Cors issues.