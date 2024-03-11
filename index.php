<?php

declare(strict_types=1);

// spl_autoload_register(function ($class) {
//     require __DIR__ . "/src/controllers/$class.php";
//     require __DIR__ . "/src/models/$class.php";
// });

// Controllers
require_once __DIR__ . "/src/controllers/UserController.php";
require_once __DIR__ . "/src/controllers/DataController.php";
// Models
require_once __DIR__ . "/src/models/UserModel.php";
require_once __DIR__ . "/src/models/DataModel.php";
// Utils
require_once __DIR__ . "/src/utils/ErrorHandler.php";
require_once __DIR__ . "/src/utils/Validator.php";
// Database
require_once __DIR__ . "/src/database/Database.php";
// Requests
require_once __DIR__ . "/src/requests/UserRegisterRequestData.php";
require_once __DIR__ . "/src/requests/UserLoginRequestData.php";

set_error_handler("ErrorHandler::handleError");
set_exception_handler("ErrorHandler::handleException");

header("Content-type: application/json; charset=UTF-8");

$parts = explode("/", $_SERVER["REQUEST_URI"]);

if ($parts[1] != "api") {
    http_response_code(404);
    exit;
}
$controller = $parts[2];
$method = $parts[3];
$id = $parts[4] ?? null;

$config = include 'db_config.php';

$database = new Database($config);
$database->connect();

switch ($controller) {
    case 'user':
        $controller = new UserController(new UserModel($database));
        break;
    case 'data':
        $controller = new DataController(new DataModel($database));
        break;
    default:
        http_response_code(404);
        exit;
}

$controller->processRequest($method, $id);
