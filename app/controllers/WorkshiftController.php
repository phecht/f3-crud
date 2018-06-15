<?php

class WorkShiftController extends Controller {

	function __construct() {
		parent::__construct();
		$this->f3->set( 'locs', $this->locs() );

	}

	public function index() {
		$workshift = new Workshift( $this->db );
		$user      = new User( $this->db );
		$user_rows = $this->db->exec( 'select id, name FROM users' );
		$this->f3->set( 'user_rows', $user_rows );

		$workshiftv = $this->db->exec(
			'select w.id, w.startwork, w.endwork, u.name, l.locname from workshifts w 
			left join users u ON(u.id = w.userid) 
			left join locs l ON (l.id = w.shiftloc) order by w.startwork');
		$this->f3->set( 'workshifts', $workshiftv );


		$this->f3->set( 'page_head', 'Workshift List' );
		$this->f3->set( 'message', $this->f3->get( 'PARAMS.message' ) );
		$this->f3->set( 'view', 'workshift/list.htm' );
		$this->f3->set( 'type', 'workshift' );
	}

	/**
	 * Create a new workshift
	 */
	public function create() {
		if ( $this->f3->exists( 'POST.create' ) ) {
			$workshift = new Workshift( $this->db );
			$workshift->add();

			$this->f3->reroute( '/wssuccess/Created' );
		} else {
			$user      = new User( $this->db );
			$user_rows = $this->db->exec( 'select id, name FROM users' );
			$this->f3->set( 'user_rows', $user_rows );
			$this->f3->set( 'page_head', 'Create Workshift' );
			$this->f3->set( 'view', 'workshift/create.htm' );
			$this->f3->set( 'type', 'workshift' );
		}

	}

	public function update() {

		$workshift = new Workshift( $this->db );

		if ( $this->f3->exists( 'POST.update' ) ) {
			$workshift->edit( $this->f3->get( 'POST.id' ) );
			$this->f3->reroute( '/wssuccess/Updated' );
		} else {
			$workshift->getById( $this->f3->get( 'PARAMS.id' ) );
			$user      = new User( $this->db );
			$user_rows = $this->db->exec( 'select id, name FROM users' );
			$this->f3->set( 'user_rows', $user_rows );
			// $this->f3->set( 'user', $workshift );
			$this->f3->set( 'page_head', 'Update Workshift' );
			$this->f3->set( 'view', 'workshift/update.htm' );
			$this->f3->set( 'type', 'workshift' );
		}

	}

	public function delete() {
		if ( $this->f3->exists( 'PARAMS.id' ) ) {
			$workshift = new Workshift( $this->db );
			$workshift->delete( $this->f3->get( 'PARAMS.id' ) );
		}

		$this->f3->reroute( '/wssuccess/Workshift Deleted' );
	}

	public function copyIt() {
		if ( $this->f3->exists( 'PARAMS.id' ) ) {
			$workshift = new Workshift( $this->db );
			$workshift->getById( $this->f3->get( 'PARAMS.id' ) );
			$new_workshift = new Workshift( $this->db );
			$source        = $workshift->cast();
			unset( $source['id'] );
			$new_workshift->copyfrom( $source );
			$new_workshift->save();
			$this->f3->set( 'page_head', 'Update Workshift' );
			$this->f3->set( 'view', 'workshift/update.htm' );
			$this->f3->set( 'type', 'workshift' );
		}
	}


	private function locs() {
		return $this->db->exec( 'select id, locname FROM locs ' );
	}
}
