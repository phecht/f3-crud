<?php

class PositionController extends Controller {

	public function index() {
		$position = new Position( $this->db );
		$this->f3->set( 'Positions', $position->all() );
		$this->f3->set( 'page_head', 'Position List' );
		$this->f3->set( 'message', $this->f3->get( 'PARAMS.message' ) );
		$this->f3->set( 'view', 'Position/list.htm' );
		$this->f3->set( 'type', 'position' );
	}

	/**
	 * Create a new Position
	 */
	public function create() {
		if ( $this->f3->exists( 'POST.create' ) ) {
			$position = new Position( $this->db );
			$position->add();

			$this->f3->reroute( '/dsuccess/New Position Created' );
		} else {
			$this->f3->set( 'page_head', 'Create Position' );
			$this->f3->set( 'view', 'position/create.htm' );
			$this->f3->set( 'type', 'osition' );
		}

	}

	public function update() {

		$date = new Date( $this->db );

		if ( $this->f3->exists( 'POST.update' ) ) {
			$date->edit( $this->f3->get( 'POST.id' ) );
			$this->f3->reroute( '/dsuccess/Date Updated' );
		} else {
			$date->getById( $this->f3->get( 'PARAMS.id' ) );
			$this->f3->set( 'user', $date );
			$this->f3->set( 'page_head', 'Update Date' );
			$this->f3->set( 'view', 'date/update.htm' );
			$this->f3->set( 'type', 'date' );
		}

	}

	public function delete() {
		if ( $this->f3->exists( 'PARAMS.id' ) ) {
			$date = new Date( $this->db );
			$date->delete( $this->f3->get( 'PARAMS.id' ) );
		}

		$this->f3->reroute( '/psuccess/Position Deleted' );
	}
}
