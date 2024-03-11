<?php

class Database {
    private $host;
    private $dbname;
    private $username;
    private $password;
    private $pdo;

    public function __construct(array $config) {
        $this->host = $config['db_host'] ?? '127.0.0.1';
        $this->dbname = $config['db_name'] ?? '';
        $this->username = $config['db_user'] ?? '';
        $this->password = $config['db_password'] ?? '';
    }

    public function connect(): void {
        $dsn = "mysql:host={$this->host};dbname={$this->dbname};charset=utf8mb4";

        try {
            $this->pdo = new PDO($dsn, $this->username, $this->password);
            // Set PDO to throw exceptions on error
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            // Handle connection error
            exit("Database connection failed: " . $e->getMessage());
        }
    }

    public function execute(string $sql, array $params = []) {
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
            return true; // Or return fetched data if needed
        } catch (PDOException $e) {
            // Handle query execution error
            exit("Query execution failed: " . $e->getMessage());
        }
    }

    public function query(string $sql, array $params = []) {
        try {
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
            return $stmt; // Return the PDOStatement object
        } catch (PDOException $e) {
            // Handle query execution error
            exit("Query execution failed: " . $e->getMessage());
        }
    }
}
