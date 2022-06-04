<?php 
session_start();

if ($_SESSION) {
    header("Location: mainsite.html");
    exit;
} else {
    header("Location: login.php");
    exit;
}
?>