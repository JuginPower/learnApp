<?php
session_start();
include "datalayer.php";
$json = file_get_contents('php://input');
$data = (array) json_decode($json);
$response = '';

switch ($data['param']) {
    case 'usersession':
        $response = executesql($data['sql'], $_SESSION['userdata']['id'], $data['paramtype'], $data['arraytype']);
        break;
}

echo json_encode($response);

?>