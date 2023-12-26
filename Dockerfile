FROM nginx:latest
RUN sed -i 's/nginx/imad/g' /usr/share/nginx/html/index.html
EXPOSE 80

