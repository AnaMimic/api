<?php

class UserModel {
    private $db;

    public function __construct(Database $db) {
        $this->db = $db;
    }

    public function registerUser(string $username, string $email, string $password) {
        // Insert user data into UserProfile table
        $sql = "INSERT INTO UserProfile (username, email, pswd) VALUES (?, ?, ?)";
        return $this->db->execute($sql, [$username, $email, $password]);
    }

    public function loginUser(string $username, string $password) {
        // Query the database to fetch user data based on username
        $sql = "SELECT userID, username, email, pswd FROM UserProfile WHERE username = ?";
        $result = $this->db->query($sql, [$username]);
    
        if ($result && $user = $result->fetch(PDO::FETCH_OBJ)) {
            // Verify the password
            if (password_verify($password, $user->pswd)) {
                // Update last login time
                $this->updateLastLogin($user->userID);
    
                // Password is correct, return user data as object
                return $user;
            }
        }
    
        // If user is not found or password is incorrect, return false
        return false;
    }
    
    private function updateLastLogin(int $userID) {
        $sql = "UPDATE UserProfile SET last_login = NOW() WHERE userID = ?";
        $this->db->execute($sql, [$userID]);
    }
}
?>
