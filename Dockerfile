FROM nginx:alpine

# Copy the HTML file to nginx's default serving directory
COPY index.html /usr/share/nginx/html/

# Copy all root PNG image files (logos, etc.)
COPY *.png /usr/share/nginx/html/

# Copy the magnetic-phone-holder-for-gym page and its assets (jpg/png)
COPY magnetic-phone-holder-for-gym/ /usr/share/nginx/html/magnetic-phone-holder-for-gym/

# Copy sitemap.xml
COPY sitemap.xml /usr/share/nginx/html/

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"] 