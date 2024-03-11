<?php

function validateUserRegisterData($data) {
    // Check if data exists and contains required fields
    if (!$data || !isset($data->username) || !isset($data->pswd)) {
        return false;
    }

    // Return an instance of UserRegisterRequestData
    return new UserRegisterRequestData($data->username, $data->email, $data->pswd);
}

function validateUserLoginData($data) {
    // Check if data exists and contains required fields
    if (!$data || !isset($data->username) || !isset($data->pswd)) {
        return false;
    }

    // Return an instance of UserRegisterRequestData
    return new UserLoginRequestData($data->username, $data->pswd);
}

?>
