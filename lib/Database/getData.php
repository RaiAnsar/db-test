<?php
require('connection.php');

$makeQuery = "SELECT * FROM countries";

$statement = $connection->prepare($makeQuery);

$statement->execute();

$array = array();

while ($resultsFrom = $statement -> fetch()){
    array_push(
        $myarray, array(
        "id" => $resultsFrom['country_ID'],
        "country" => $resultsFrom['country'],
        "iso" => $resultsFrom['iso'],
        "iso3" => $resultsFrom['iso3']

        )
    );
}

echo json_encode($array);

?>