<?php

function validateUserData($data) {
    if (!$data || !isset($data['username']) || !isset($data['password'])) {
        return false;
    }

    return new UserRegisterRequestData($data['username'], $data['password']);
}

?>
