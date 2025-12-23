<?php
$host = 'localhost';
$db   = 'dbms';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
    echo "Connection successful!\n";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage() . "\n";
    
    echo "Trying 127.0.0.1...\n";
    $dsn2 = "mysql:host=127.0.0.1;dbname=$db;charset=$charset";
    try {
        $pdo2 = new PDO($dsn2, $user, $pass, $options);
        echo "Connection successful with 127.0.0.1!\n";
    } catch (PDOException $e2) {
        echo "Connection with 127.0.0.1 failed: " . $e2->getMessage() . "\n";
    }
}
?>
