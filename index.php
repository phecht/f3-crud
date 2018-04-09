<?php


require 'lib/base.php';

$f3 = Base::instance();

if ( file_exists( '.env2' ) ) {
	$f3->config( '.env2' );
} else {
	$temp = getenv( 'db_dns' );
	$f3->set( 'db_dns', $temp );
	$temp = getenv( 'db_name' );
	$f3->set( 'db_name', $temp );
	$temp = getenv( 'db_pass' );
	$f3->set( 'db_pass', $temp );
	$temp = getenv( 'db_user' );
	$f3->set( 'db_user', $temp );
}


$f3->config( 'config/config.ini' );
$f3->config( 'config/routes.ini' );
$f3->run();
