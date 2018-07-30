<?php

class WksController extends Controller {

    function __construct() {
        parent::__construct();
        $wksnote = new Wks( $this->db );
    }

    public function index() {
        $wks = new Wks( $this->db );
        $this->f3->set( 'wkss', $wks->all() );
        $this->f3->set( 'page_head', 'Workshift List' );
        $this->f3->set( 'message', $this->f3->get( 'PARAMS.message' ) );
        $this->f3->set( 'view', 'wks/list.htm' );
        $this->f3->set( 'type', 'wkss' );
    }

    /**
     * Create a new workshift
     */
    public function create() {
        if ( $this->f3->exists( 'POST.create' ) ) {
            $wks->add();

            $this->f3->reroute( '/wkssuccess/New workshift Created' );
        } else {
            $this->f3->set( 'page_head', 'Create workshift' );
            $this->f3->set( 'view', 'wks/create.htm' );
            $this->f3->set( 'type', 'wkss' );
        }

    }

    public function update() {


        if ( $this->f3->exists( 'POST.update' ) ) {
            $wks->edit( $this->f3->get( 'POST.id' ) );
            $this->f3->reroute( '/wkssuccess/Workshift Updated' );
        } else {
            $wks = new Wks( $this->db );
            $wks->getById( $this->f3->get( 'PARAMS.id' ) );
            $this->f3->set( 'user', $date );
            $this->f3->set( 'page_head', 'Update Date' );
            $this->f3->set( 'view', 'wks/update.htm' );
            $this->f3->set( 'type', 'date' );
        }

    }

    public function delete() {
        if ( $this->f3->exists( 'PARAMS.id' ) ) {
            $wks->delete( $this->f3->get( 'PARAMS.id' ) );
        }

        $this->f3->reroute( '/bcnsuccess/Date Deleted' );
    }
}
