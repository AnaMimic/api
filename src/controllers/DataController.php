<?php

require_once 'vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class DataController {
    private $dataModel;

    public function __construct(DataModel $dataModel) {
        $this->dataModel = $dataModel;
    }

    public function processRequest(string $method, ?string $id): void {
        // Extract user ID from JWT token if present
        $userID = $this->extractUserIDFromToken();

        switch ($method) {
            case 'gene-search':
                $this->geneSearch($userID);
                break;
            case 'breed-search':
                $this->breedSearch($userID);
                break;
            case 'retrieve-search':
                $this->retrieveSearch($userID);
            default:
                http_response_code(404);
                exit;
        }
    }

    //     curl -X POST http://localhost/api/data/gene-search \
    // -H "Content-Type: application/json" \
    // -d '{
    //   "genename": "F1"
    // }'

    //  curl --location 'http://localhost/api/data/gene-search' \
    // --header 'Content-Type: application/json' \
    // --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjIsImlzc3VlZEF0IjoxNzExNTcxMTg5LCJleHBpcmF0aW9uIjoxNzExNTc0Nzg5fQ.248POfyMQTaMj965nIZBKOQ38953jX8W3GzzaovQcqo' \
    // --data '{"genename": "F1"}'

    // RESPONSE EXAMPLE
    // {
    //     "success": true,
    //     "message": "Data retrieved succesfully",
    //     "data": {
    //         "info": {
    //             "geneid": "LAX1",
    //             "name": "F1",
    //             "description": "gene_id LAX1; transcript_id ; db_xref GeneID:101082716; db_xref VGNC:VGNC:107891; gbkey Gene; gene LAX1; gene_biotype protein_coding; ",
    //             "chromosomal_location": "42055184:42065443",
    //             "breed_name": "Norwegian Forest Cat",
    //             "url": "https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/"
    //         },
    //         "mutations": [
    //             {
    //                 "mutationID": 222409,
    //                 "description": "Sample mutation 2 for gene F1",
    //                 "effect": "Beneficial"
    //             },
    //             {
    //                 "mutationID": 318126,
    //                 "description": "Sample mutation 1 for gene F1",
    //                 "effect": "Harmful"
    //             }
    //         ]
    //     }
    // }
    public function geneSearch($userID) {
        
        header("Content-Type: application/json");

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
           
            $data = json_decode(file_get_contents("php://input"));

            $validatedData = validateDataGeneSearchData($data);
            if ($validatedData !== false) {

                $results = $this->dataModel->quickSearch($data->genename);

                if ($results){
                
                    //QUESTION: Do you know how to access the userID in this script? I need it to save the search of the user. from the JWT token maybe?
                    if ($userID) {
                        $this->dataModel->saveSearch(json_encode($data), $userID);
                    }
                
                    $response = array(
                        "success" => true,
                        "message" => "Data retrieved succesfully",
                        "data" => $results
                    );
                } else {
                    $response = array(
                        "success" => false,
                        "message" => "Failed to retrieve data"
                    );
                }
            } else {
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

    //     curl -X POST http://localhost/api/data/breed-search \
    // --header 'Content-Type: application/json' \
    // -d '{
    //   "breed": "Burmese"
    // }'

    //     curl -X POST http://localhost/api/data/breed-search \
    // --header 'Content-Type: application/json' \
    // --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjIsImlzc3VlZEF0IjoxNzExNTcxMTg5LCJleHBpcmF0aW9uIjoxNzExNTc0Nzg5fQ.248POfyMQTaMj965nIZBKOQ38953jX8W3GzzaovQcqo' \
    // -d '{
    //   "breed": "Burmese"
    // }'

    // RESPONSE EXAMPLE
    // {
    //     "success": true,
    //     "message": "Data retrieved succesfully",
    //     "data": {
    //         "info": {
    //             "description": "Hypoallergenic, specific traits and origin not provided",
    //             "origin": "Not provided"
    //         },
    //         "genes": [
    //             {
    //                 "name": "A2",
    //                 "geneID": "ANKRD7"
    //             },
    //             {
    //                 "name": "B3",
    //                 "geneID": "KIAA0586"
    //             },
    //             {
    //                 "name": "D3",
    //                 "geneID": "RPH3A"
    //             }
    //         ]
    //     }
    // }
    public function breedSearch($userID) {
        // Set headers for JSON response
        header("Content-Type: application/json");

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Read JSON data from request body
            $data = json_decode(file_get_contents("php://input"));

            $validatedData = validateDataBreedSearchData($data);
            if ($validatedData !== false) {

                $results = $this->dataModel->breedSearch($data->breed);
                if ($results){
                    if ($userID) {
                        $this->dataModel->saveSearch(json_encode($data), $userID);
                    }

                    $response = array(
                        "success" => true,
                        "message" => "Data retrieved succesfully",
                        "data" => $results
                    );
                } else {
                    $response = array(
                        "success" => false,
                        "message" => "Failed to retrieve data"
                    );
                }
            } else {
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

    //     curl -X GET http://localhost/api/data/retrieve-search \
    // --header 'Content-Type: application/json' \
    // --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjIsImlzc3VlZEF0IjoxNzExNTcxMTg5LCJleHBpcmF0aW9uIjoxNzExNTc0Nzg5fQ.248POfyMQTaMj965nIZBKOQ38953jX8W3GzzaovQcqo'

    // RESPONSE EXAMPLE
    // {
    //     "success": true,
    //     "message": "Data retrieved succesfully",
    //     "data": {
    //         "searchparameters": "{\"breed\":\"Burmese\"}"
    //     }
    // }
    public function retrieveSearch($userID){
        header("Content-Type: application/json");
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            if ($userID) {
                $results=$this->dataModel->lastSearch($userID);
                
                if ($results){
                    $response = array(
                        "success" => true,
                        "message" => "Data retrieved succesfully",
                        "data" => $results
                    );
                } else {
                    $response = array(
                        "success" => false,
                        "message" => "Failed to retrieve data"
                    );
                }
            } else {
                $response = array(
                    "success" => false,
                    "message" => "Invalid or incomplete data"
                );
            }
        } else {
            // If request method is not GET, return an error response
            $response = array(
                "success" => false,
                "message" => "Invalid request method"
            );
        }

        // Output the JSON response
        echo json_encode($response);
    }

    // Private functions
    private function extractUserIDFromToken(): ?int {
        // Check if Authorization header is present
        $headers = getallheaders();
        $token = null;

        foreach ($headers as $name => $value) {
            if ($name === 'Authorization') {
                // Check if the value starts with "Bearer "
                if (strpos($value, 'Bearer ') === 0) {
                    $token = substr($value, 7); // Removes "Bearer " prefix
                    break;
                }
            }
        }

        // Check if the Authorization header matches the Bearer pattern
        if($token) {
            try {
                // Your JWT secret key
                $secretKey = "your-secret-key";
            
                // Verify and decode the JWT token
                $decoded = JWT::decode($token, new Key($secretKey, 'HS256'));

                return $decoded->userId;
            } catch (Exception $e) {
                // Error handling if JWT decoding fails
                $response = array(
                    "success" => false,
                    "message" => "Invalid token",
                    "error" => $e->getMessage()
                );
                echo json_encode($response);
                exit; // Exit the script if token is invalid
            }
        }
        return null; // Set user_id to null or any default value
    }
}
?>
