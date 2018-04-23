<?php

class DashboardController extends Controller {

	public function index() {

		$this->f3->set( 'page_head', 'Dashboard' );
		$this->f3->set( 'view', 'dashboard/home.htm' );
		$this->f3->set( 'type', 'dashboard' );
		$event = new Event( $this->db );
		$this->f3->set( 'dashevents', $event->dashdisplay() );

	}


	public function getevents() {
		$event = new Event( $this->db );
		$this->f3->set( 'dashevents', $event->dashdisplay() );
	}
}
