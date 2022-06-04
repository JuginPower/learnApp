<?php // Passwörter sind balthazarkraft90, banana, 123
include "datalayer.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $username = $_POST["username"];
    $pwd = password_hash($_POST["pwd"], PASSWORD_DEFAULT);
    $email = $_POST["email"];

    $row = executesql("SELECT * FROM user_learn WHERE benutzername=(?) OR email=(?)", array($username, $email), "ss", "assoc");
    
    if (is_null($row)) {
        executesql("INSERT INTO user_learn (benutzername, passwort, email) VALUES (?, ?, ?)", array($username, $pwd, $email), "sss");
    } else {
        echo "Der Benutzer $username existiert bereits schon!"; // Man muss bedenken dass keine Überprüfung des Passworts hier stattfindet
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>
<body>
<a href="login.php">Login</a>
    <form action="register.php" method="post">
        <h1>Account Erstellen</h1>
        <input type="text" placeholder="Benutzername" name="username" id="username" autocomplete="off" required><br>
        <input type="password" placeholder="Passwort" name="pwd" id="pwd" autocomplete="off" required><br>
        <input type="email" placeholder="Email" name="email" id="email" autocomplete="off" required><br>
        <button type="submit">Erstellen!</button>
    </form>
</body>
</html>