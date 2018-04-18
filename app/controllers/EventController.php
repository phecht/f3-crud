<?php

class EventController extends Controller {

	public function index() {
		$event = new Event( $this->db );
		$this->f3->set( 'events', $event->all() );
		$this->f3->set( 'page_head', 'Event List' );
		$this->f3->set( 'message', $this->f3->get( 'PARAMS.message' ) );
		$this->f3->set( 'view', 'event/list.htm' );
		$this->f3->set( 'type', 'event' );
	}

	/**
	 * Create a new event
	 */
	public function create() {
		if ( $this->f3->exists( 'POST.create' ) ) {
			$event = new Event( $this->db );
			$event->add();

			$this->f3->reroute( '/dsuccess/New event Created' );
		} else {
			$this->f3->set( 'page_head', 'Create Event' );
			$this->f3->set( 'view', 'event/create.htm' );
			$this->f3->set( 'type', 'event' );
		}

	}

	public function update() {

		$event = new Event( $this->db );

		if ( $this->f3->exists( 'POST.update' ) ) {
			$event->edit( $this->f3->get( 'POST.id' ) );
			$this->f3->reroute( '/dsuccess/Event Updated' );
		} else {
			$event->getById( $this->f3->get( 'PARAMS.id' ) );
			$this->f3->set( 'user', $event );
			$this->f3->set( 'page_head', 'Update Event' );
			$this->f3->set( 'view', 'event/update.htm' );
			$this->f3->set( 'type', 'event' );
		}

	}

	public function delete() {
		if ( $this->f3->exists( 'PARAMS.id' ) ) {
			$event = new Event( $this->db );
			$event->delete( $this->f3->get( 'PARAMS.id' ) );
		}

		$this->f3->reroute( '/dsuccess/Event Deleted' );
	}
}
