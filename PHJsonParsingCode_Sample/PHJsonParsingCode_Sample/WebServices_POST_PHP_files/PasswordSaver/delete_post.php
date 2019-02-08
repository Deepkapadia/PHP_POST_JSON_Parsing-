<?php

    $con=new MySQLi("localhost","root","","PassSaver");
    
    $id = $_POST["id"];
  	$name = $_POST["name"];
    $password = $_POST["password"];

    
    $qu="delete from Paswords where id='$id' and name='$name' and password='$password'";

    $con->query($qu);
    
    echo "success";
    
?>

