<?php
// db_dns=pgsql:host=ec2-54-243-54-6.compute-1.amazonaws.com;port=5432;dbname=
// db_name=d8ih8v0uco62k8
// db_user=pshnyysokpitwg
// db_pass=4de36e80c262da3b793ea42d10de9f8c94031a049ecdb6ab773247ca69918121 


$f3=require('lib/base.php');
$dns = $f3->get('db_dns');
$dname = $f3->get('db_name');
$duser = $f3->get('db_user');
$dpass= $f3->get('db_pass');

echo $dns, $dname, $duser, $dpass;
$f3->config('config/config.ini');
$f3->config('config/routes.ini');
$f3->run();
?>