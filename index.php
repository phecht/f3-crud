<?php
/**
 * Index.php is the main enty point for this app. Doc comment
 *
 * @category Index
 * @package BCStuff
 * @author P Dev Hecht
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License
 * @link http://google.com
 */
//require 'vendor/bcosca/fatfree/lib/base.php';
require 'vendor/autoload.php';
$f3 = Base::instance();

/* $f3->config( 'vendor/ikkez/f3-opauth/lib/opauth/opauth.ini', TRUE );

$opauth = OpauthBridge::instance( $f3->opauth );

$opauth->onSuccess( function( $data ) {
    header( 'Content-Type: text' );
    echo 'User successfully authenticated.' . "\n";
    print_r( $data['info'] );
});

$opauth->onAbort( function( $data ) {
    header( 'Content-Type: text' );
    echo 'Auth request was canceled.' . "\n";
    print_r( $data );
});
 */
$f3->config( 'config/config.ini' );
$f3->config( 'config/routes.ini' );

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

    $f3->set( 'bc_dns',  getenv( 'bc_dns' ) );
    $f3->set( 'bc_name', getenv( 'bc_name' ) );
    $f3->set( 'bc_pass', getenv( 'bc_pass' ) );
    $f3->set( 'bc_user', getenv( 'bc_user' ) );

    $f3->set( 'DEBUG', 0 );

}


new Session();


$f3->set( 'dcolors', array( 'aqua', 'black', 'blue', 'fuchsia', 'gray', 'green', 'lime', 'maroon', 'navy', 'olive', 'purple', 'red', 'silver', 'teal', 'yellow' ) );
$f3->set( 'ampm', array( 'AM', 'PM'));
$f3->run();
