<?php

class TestDBController extends Controller {

	function __construct() {
		parent::__construct();
		$bcnote = new TestDB( $this->dbbc );
	}

	public function index() {
		$testDB = new TestDB( $this->dbbc );
		// $this->f3->set( 'testdb', $testDB->all() );
		
		$testdata = $this->dbbc->exec(
			'select DateOfEntry, NetSales from barcarresults LIMIT 50;');

		$this->f3->set( 'testdatas', $testdata);
		$this->f3->set( 'page_head', 'Test List' );
		$this->f3->set( 'message', $this->f3->get( 'PARAMS.message' ) );
		$this->f3->set( 'view', 'test/list.htm' );
		$this->f3->set( 'type', 'test' );
	}

	public function bsindex() {
		$template = new Template;
		echo $template->render('bs4.html');
	}
	/**
	 * Create a new note
	 */
/* 	public function create() {
		if ( $this->f3->exists( 'POST.create' ) ) {
			$bcnote->add();

			$this->f3->reroute( '/bcnsuccess/New Note Created' );
		} else {
			$this->f3->set( 'page_head', 'Create Note' );
			$this->f3->set( 'view', 'bcnote/create.htm' );
			$this->f3->set( 'type', 'bcnotes' );
		}

	}

	public function update() {


		if ( $this->f3->exists( 'POST.update' ) ) {
			$bcnote->edit( $this->f3->get( 'POST.id' ) );
			$this->f3->reroute( '/bcnsuccess/Date Updated' );
		} else {
			$bcnote = new BCnote( $this->db );
			$bcnote->getById( $this->f3->get( 'PARAMS.id' ) );
			$this->f3->set( 'user', $date );
			$this->f3->set( 'page_head', 'Update Date' );
			$this->f3->set( 'view', 'bcnote/update.htm' );
			$this->f3->set( 'type', 'date' );
		}

	}

	public function delete() {
		if ( $this->f3->exists( 'PARAMS.id' ) ) {
			$bcnote->delete( $this->f3->get( 'PARAMS.id' ) );
		}

		$this->f3->reroute( '/bcnsuccess/Date Deleted' );
	} */
}
