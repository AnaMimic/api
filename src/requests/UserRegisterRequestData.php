<?php

class UserRegisterRequestData {
    public $username;
    public $email;
    public $pswd;

    public function __construct($username, $email, $pswd) {
        $this->username = $username;
        $this->email = $email;
        $this->pswd = $pswd;
    }
}

?>
