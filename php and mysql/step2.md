
Launch a shell in the container.

` docker exec -it apache /bin/bash`{{execute}}

`exit`{{execute}}


Define test.php in the host machine as follows.
```
<h1> Hello </h1> 

PHP Version is: 
<?php 
	printf(phpversion());
?>

```


Copy test.php into the container.

`docker cp test.php apache:var/www/html`{{execute}}


`curl localhost/test.php`{{execute}}

Visit localhost at port 80 with browser.

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/test.php



