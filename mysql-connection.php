<?php
$servername = getenv('DB_SERVER');
$database = getenv('DB_NAME');
$username = getenv('DB_USER');
$password = getenv('DB_PASSWORD');
// echo $servername;
// echo $database;
// echo $username;
// echo $password;
// Create connection
$conn = @new mysqli($servername, $username, $password);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . mysqli_connect_error());
}else{
  echo "Connected successfully";
}
?>