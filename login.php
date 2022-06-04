<?php // Passwörter sind balthazarkraft90, banana, 123
include "datalayer.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $username = $_POST["username"];
    $pwd = $_POST["pwd"];
    $userdata = executesql("SELECT * FROM user_learn WHERE benutzername=(?)", $username, "s", "assoc");
    
    if (!is_null($userdata)) {
        $verifypwd = password_verify($pwd, $userdata['passwort']); // Hier wird das Passwort mit dem Hash verglichen.

        if ($verifypwd === false) {
            echo "Login fehlgeschlagen! Passwort stimmt nicht überein.";
        } elseif ($verifypwd === true) {

            session_start();
            $_SESSION['userdata'] = $userdata;
            header("Location: mainsite.html");
            exit;
        }
    } else {
        echo "Der Benutzer $username existiert nicht.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <a href="register.php">Registrierung</a>
    <form action="login.php" method="post">
        <h1>Login</h1>
        <input type="text" placeholder="Benutzername" name="username" id="username" required><br>
        <input type="password" placeholder="Passwort" name="pwd" id="pwd" required><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>