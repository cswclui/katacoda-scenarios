Modify login.php to make use of parameterized query to defend against SQL injection.

```
<h1>Login</h1>
<form action="login.php" method="GET">
Username:
<input type="text" name="user_name"><br>
Password:
<input type="text" name="password"><br>
<input type="submit">
</form>


<?php
if (isset($_GET["user_name"]) && isset($_GET["password"])) {
   $servername = "mysql:3306";
   $username = "root";
   $password = "12345";
   // Create connection
   $conn = new mysqli($servername, $username, $password);
   // Check connection
   if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
	// prepare and bind
	$stmt = $conn->prepare("SELECT name, password FROM mydb.USER WHERE name=? and password=?");
	$stmt->bind_param("ss", $_GET["user_name"] , $_GET["password"]);

	//set parameters
	$user = $_GET["user_name"];
	$pw = $_GET["password"];
	
	//execute the prepared statement
	$result = $stmt->execute();

	//grab a result set
	$resultSet = $stmt->get_result();

	
      if (!$resultSet) {
      trigger_error('Invalid query: ' . $conn->error);
      }

      if ($resultSet->num_rows > 0) {
     	 $row = $resultSet ->fetch_assoc(); //fetch a result row as an associative array
      	echo "<h2> Welcome: ".$row["name"]."</h2>";
      }
      else {
      	echo "<h2>Invalid username/password!</h2>";
      }

	$conn->close();
}
?>    
```{{copy}}

Copy login.php to the apache container.

`docker cp login.php apache:/var/www/html`{{execute}}


Check that SQL injection no longer works.


> **Exercise**: 
>  Create a page addUser.php to allow users to be added to the Person table.
Defend against SQL injection by using parametrized query.
