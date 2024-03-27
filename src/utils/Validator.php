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

function validateDataGeneSearchData($data) {
    // Check if data exists and contains required fields
    if (!$data || !isset($data->genename)) {
        return false;
    }

    // Return an instance of DataGeneSearchRequestData
    return new DataGeneSearchRequestData($data->genename);
}

function validateDataBreedSearchData($data) {
    // Check if data exists and contains required fields
    if (!$data || !isset($data->breed)) {
        return false;
    }

    // Return an instance of DataGeneSearchRequestData
    return new DataBreedSearchRequestData($data->breed);
}

?>
