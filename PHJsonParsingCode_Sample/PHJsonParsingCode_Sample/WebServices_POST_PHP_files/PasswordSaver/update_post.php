<?php

    $con=new MySQLi("localhost","root","","PassSaver");
    
    $id = $_POST["id"];
    $name = $_POST["name"];
    $password = $_POST["password"];

    
    $qu="update Paswords set name='$name', password='$password' where id='$id'";

    $con->query($qu);
    
    echo "success";
    
?>

