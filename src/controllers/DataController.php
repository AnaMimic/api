<?php

class DataController {
    private $dataModel;

    public function __construct(DataModel $dataModel) {
        $this->dataModel = $dataModel;
    }

    public function processRequest(string $method, ?string $id): void {
        switch ($method) {
            case 'example':
                $this->example();
                break;
            default:
                http_response_code(404);
                exit;
        }
    }

    public function example() {
        // Set headers for JSON response
        header("Content-Type: application/json");

        $response = array(
            "success" => true,
            "message" => "Data retrieved succesfully",
        );

        // Output the JSON response
        echo json_encode($response);
    }

}
?>