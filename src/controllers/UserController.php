<?php

require_once 'vendor/autoload.php';

use Firebase\JWT\JWT;

class UserController {
    private $userModel;

    public function __construct(UserModel $userModel) {
        $this->userModel = $userModel;
    }

    public function processRequest(string $method, ?string $id): void {
        switch ($method) {
            case 'register':
                $this->register();
                break;
            case 'login':
                $this->login();
                break;
            default:
                http_response_code(404);
                exit;
        }
    }

    //     curl -X POST http://localhost/api/user/register \
    // -H "Content-Type: application/json" \
    // -d '{
    //   "username": "your_username",
    //   "email": "your_email@example.com",
    //   "pswd": "your_password"
    // }'
    public function register() {
        // Set headers for JSON response
        header("Content-Type: application/json");
    
        // Check if data is sent via POST request
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Read JSON data from request body
            $data = json_decode(file_get_contents("php://input"));
    
            // Validate user data
            $validatedData = validateUserRegisterData($data);
    
            if ($validatedData !== false) {
                // Extract username, email, and password from the validated data
                $username = $validatedData->username;
                $email = $validatedData->email;
                $password = $validatedData->pswd;
    
                // Hash the password
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    
                // Call the UserModel to create the user in the database
                $success = $this->userModel->registerUser($username, $email, $hashedPassword);
    
                if ($success) {
                    $response = array(
                        "success" => true,
                        "message" => "User successfully registered"
                    );
                } else {
                    $response = array(
                        "success" => false,
                        "message" => "Failed to create user"
                    );
                }
            } else {
                // If data is invalid, return an error response
                $response = array(
                    "success" => false,
                    "message" => "Invalid or incomplete data"
                );
            }
        } else {
            // If request method is not POST, return an error response
            $response = array(
                "success" => false,
                "message" => "Invalid request method"
            );
        }
    
        // Output the JSON response
        echo json_encode($response);
    }

    //     curl -X POST http://localhost/api/user/login \
    // -H "Content-Type: application/json" \
    // -d '{
    //   "username": "your_username",
    //   "pswd": "your_password"
    // }'
    public function login() {
        // Set headers for JSON response
        header("Content-Type: application/json");
    
        // Check if data is sent via POST request
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Read JSON data from request body
            $data = json_decode(file_get_contents("php://input"));
    
            // Validate user data
            $validatedData = validateUserLoginData($data);
    
            if ($validatedData !== false) {
                // Extract username and password from the validated data
                $username = $validatedData->username;
                $password = $validatedData->pswd;
    
                // Call the UserModel to verify the user's credentials
                $loggedInUser = $this->userModel->loginUser($username, $password);
    
                if ($loggedInUser) {
                    // Generate authentication token (JWT)
                    $authToken = $this->generateAuthToken($loggedInUser->userID);
    
                    $response = array(
                        "success" => true,
                        "message" => "User logged in successfully",
                        "authToken" => $authToken
                    );
                } else {
                    $response = array(
                        "success" => false,
                        "message" => "Invalid username or password"
                    );
                }
            } else {
                // If data is invalid, return an error response
                $response = array(
                    "success" => false,
                    "message" => "Invalid or incomplete data"
                );
            }
        } else {
            // If request method is not POST, return an error response
            $response = array(
                "success" => false,
                "message" => "Invalid request method"
            );
        }
    
        // Output the JSON response
        echo json_encode($response);
    }

    // Method to generate JWT token
    private function generateAuthToken($userId) {
        // Your JWT secret key
        $secretKey = "your-secret-key";

        // Token payload
        $payload = array(
            "userId" => $userId,
            "issuedAt" => time(),
            "expiration" => time() + (60 * 60) // Token expires in 1 hour
        );

        // Generate the JWT token
        $token = JWT::encode($payload, $secretKey, "HS256");

        return $token;
    }
}
?>
