#!/bin/bash
PASSWD="wordpress_$RANDOM"
echo $PASSWD > PASSWD
cat /usr/share/wordpress/wp-config.php | \
  awk -v PASSWD=$PASSWD '
    BEGIN {
      DB_PASSWD="if (!defined(\x27DB_PASSWORD\x27))\n    define(\x27DB_PASSWORD\x27, \x27"PASSWD"\x27);"
    }
    {
      if ($0 ~ "defined\(\x27DB_USER") {
        print DB_PASSWD;
      }
      print $0
    }' > /etc/wordpress/config-localhost.php

mysqladmin create wordpress;
echo "CREATE USER 'wordpress'@'localhost' IDENTIFIED BY '$PASSWD';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
UPDATE user SET plugin='mysql_native_password' WHERE User='root';
FLUSH PRIVILEGES;" | mysql
