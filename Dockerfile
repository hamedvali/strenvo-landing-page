FROM nginx:alpine

# Copy the HTML file to nginx's default serving directory
COPY index.html /usr/share/nginx/html/

# Copy all image files
COPY *.png /usr/share/nginx/html/

# Copy sitemap.xml
COPY sitemap.xml /usr/share/nginx/html/

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"] 