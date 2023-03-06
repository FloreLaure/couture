<?php
    $host = "localhost";
    $dbname = "id20371192_couture";
    $user = "id20371192_flore";
    $pass = "r>1t}6ub(px2&6!I";
     

    /* $host = "localhost";
    $dbname = "couture";
    $user = "flore";
    $pass = "123456"; */

    try {
        $db = new PDO("mysql:host=$host; dbname=$dbname", $user, $pass);
        echo "connected";
    } catch (\Throwable $th) {
        echo "Error: ".$th->getMessage();
    }
?>