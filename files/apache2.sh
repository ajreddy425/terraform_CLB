 #!/bin/bash
  yum install httpd -y
  echo "<h2> this is response from Public Subnet2 </h2>" > /var/www/html/index.html
  chkconfig httpd on

service httpd start