
<?php
    
    $con = new mysqli("localhost","root","","PassSaver");
    
    $name = $_POST["name"];
    $password = $_POST["password"];
    
    $query = "insert into Paswords(name,password) values ('$name','$password')";
    
    $con->query($query);
    
    if($query){
        print("Inserted");
    }else{
        print("Not Inserted");
    }
    
    
?>

