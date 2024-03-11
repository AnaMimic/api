<?php

class UserLoginRequestData {
    public $username;
    public $pswd;

    public function __construct($username, $pswd) {
        $this->username = $username;
        $this->pswd = $pswd;
    }
}

?>