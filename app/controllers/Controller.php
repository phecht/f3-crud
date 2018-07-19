<?php

class Controller {

	protected $f3;
	protected $db;
	protected $dbbc;

	function beforeroute() {

		//$this->f3->reroute( '/auth/google' );

		if ( $this->f3->get( 'SESSION.user' ) === null ) {
			$this->f3->set( 'loggedin', '0' );
			$this->f3->reroute( '/login' );
			exit;
		} else {
			$this->f3->set( 'loggedin', '1' );
		}

	}

	function afterroute() {
		echo Template::instance()->render( 'layout.htm' );
	}

	function __construct() {

		$f3 = Base::instance();

		$db = new DB\SQL(
			$f3->get( 'db_dns' ) . $f3->get( 'db_name' ),
			$f3->get( 'db_user' ),
			$f3->get( 'db_pass' )
		);

		$dbbc = new DB\SQL(
			$f3->get( 'bc_dns' ) . $f3->get( 'bc_name' ),
			$f3->get( 'bc_user' ),
			$f3->get( 'bc_pass' )
		);

		$this->f3 = $f3;
		$this->db = $db;
		$this->dbbc = $dbbc;
		
	}

	public function comboView() {
		$bcgoal = new BCgoal( $this->db );
		$bcdaily = new BCdaily( $this->dbbc );

		$niceViewA = $bcgoal->niceView();
		$actualNet = $bcdaily->last7();
	
		$niceView2 = array_replace_recursive( $niceViewA, $actualNet );
		return $niceView2;
	}
}
