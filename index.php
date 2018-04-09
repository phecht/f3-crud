<?php


require 'lib/base.php';

$f3 = Base::instance();

if ( file_exists( '.env2' ) ) {
	$f3->config( '.env2' );
} else {
	$temp = getenv( 'db_dns' );
	$f3->set( 'db_dns', $tmp );
	$temp = getenv( 'db_name' );
	$f3->set( 'db_name', $tmp );
	$temp = getenv( 'db_pass' );
	$f3->set( 'db_pass', $tmp );
	$temp = getenv( 'db_user' );
	$f3->set( 'db_user', $tmp );
}


$f3->config( 'config/config.ini' );
$f3->config( 'config/routes.ini' );
$f3->run();
