FROM nginx:stable-alpine
COPY nginx.conf.template /etc/nginx/templates/default.conf.template