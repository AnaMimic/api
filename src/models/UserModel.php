<?php

class UserModel {
    private $db;

    public function __construct(Database $db) {
        $this->db = $db;
    }

    public function createUser(string $username, string $password): bool {
        $sql = "INSERT INTO users (username, password) VALUES (?, ?)";
        $params = [$username, $password];
        return $this->db->execute($sql, $params);
    }

    public function loginUser(string $username, string $password) {
        // Query the database to fetch user data based on username
        $sql = "SELECT id, username, password FROM users WHERE username = ?";
        $result = $this->db->query($sql, [$username]);

        if ($result && $user = $result->fetch(PDO::FETCH_OBJ)) {
            // Verify the password
            if (password_verify($password, $user->password)) {
                // Password is correct, return user data as object
                return $user;
            }
        }

        // If user is not found or password is incorrect, return false
        return false;
    }
}
?>
