FROM nginx:alpine

# Remove default nginx page
RUN rm -f /usr/share/nginx/html/index.html

# Copy new content
COPY index.html /usr/share/nginx/html/index.html

# Disable aggressive caching for testing
RUN echo 'server { \
    listen 80; \
    location / { \
        add_header Cache-Control "no-store, no-cache, must-revalidate, max-age=0"; \
        try_files $uri $uri/ =404; \
    } \
}' > /etc/nginx/conf.d/default.conf
