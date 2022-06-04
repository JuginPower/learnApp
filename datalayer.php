<?php

function executesql($sqlstr, $args, $type, $fetching="") { 

    $conn = new mysqli("localhost", "root", "", "learn");
    $stmt = $conn->prepare($sqlstr);
    $data = "";

    if ((gettype($args) === "array") == true) {
        $stmt->execute($args);
        } 
        else {
        $stmt->bind_param($type, $args);
        $stmt->execute();
    }
    if (str_contains($sqlstr, "SELECT")) {
        $result = $stmt->get_result();
        switch ($fetching) {
            case 'assoc':
                $data = $result->fetch_assoc();  
                break;

            case 'all':
                $data = $result->fetch_all();
                break;
        }
    } else {
        $data = mysqli_affected_rows($conn);
    }
    
    $conn->close();
    return $data;
}
?>