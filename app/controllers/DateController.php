<?php

class DateController extends Controller {

    public function index() {
        $date = new Date( $this->db );
        $this->f3->set( 'dates', $date->all() );
        $this->f3->set( 'page_head', 'Date List' );
        $this->f3->set( 'message', $this->f3->get( 'PARAMS.message' ) );
        $this->f3->set( 'view', 'date/list.htm' );
        $this->f3->set( 'type', 'date' );
    }

    /**
     * Create a new date
     */
    public function create() {
        if ( $this->f3->exists( 'POST.create' ) ) {
            $date = new Date( $this->db );
            $date->add();

            $this->f3->reroute( '/dsuccess/New date Created' );
        } else {
            $this->f3->set( 'page_head', 'Create Date' );
            $this->f3->set( 'view', 'date/create.htm' );
            $this->f3->set( 'type', 'date' );
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

        $this->f3->reroute( '/dsuccess/Date Deleted' );
    }
}
