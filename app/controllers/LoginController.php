<?php

class LoginController extends Controller {

    public function index() {

        $this->f3->set( 'page_head', 'Login' );
        $this->f3->set( 'view', 'login.htm' );

        $this->f3->set( 'type', 'login' );

    }

    public function authenticate() {

    }
}
