# Use a minimal and secure base image
FROM nginx:1.19-alpine

# Set maintainer label
LABEL maintainer="himalayjk@example.com"

# Remove default server definitions for hardening
#RUN rm -rf /etc/nginx/conf.d/*

# Copy in your custom configuration (optional and encouraged)
# COPY nginx.conf /etc/nginx/nginx.conf

# Ensure directory permissions are secure
RUN chmod -R 755 /var/cache/nginx /var/run /etc/nginx \
    && chown -R nginx:nginx /var/cache/nginx /var/run /etc/nginx

# Use a non-root user (nginx runs as non-root by default in official image)
USER 10015

# Expose HTTP port
EXPOSE 80

# Health check (optional but good for CI/CD and runtime checks)
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -q --spider http://localhost || exit 1

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
