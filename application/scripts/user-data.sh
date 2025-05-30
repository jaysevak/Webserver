#!/bin/bash
# Install web server
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Create health check endpoint
echo "OK" > /var/www/html/health

# Custom index page
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat > /var/www/html/index.html <<EOF
<html>
<head><title>Web App</title></head>
<body>
  <h1>Scalable Web Application</h1>
  <p>Instance: ${INSTANCE_ID}</p>
  <p>AZ: ${AZ}</p>
</body>
</html>
EOF
