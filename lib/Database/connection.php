<?php

try{
    $connection = new PDO('mysql:host=iraiansar.mysql.database.azure.com;dbname=lmdb_application', 'raiansar@iraiansar', 'Okara@6562');
    $connection -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Yes Connected";



}catch(PDOException $exc){
echo $exc ->getMessage();
die("Couldn't connect");
}
?>