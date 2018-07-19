<?php

class BCgoal extends DB\SQL\Mapper {

	public function __construct( DB\SQL $db ) {
		parent::__construct( $db, 'bcgoals' );
	}
	
	
	public function niceView() {
		//$bcdaily = new BCdaily( $this->dbbc );
		$niceViewA = $this->db->exec(
			'select d.dow as dow, g.goalamount from bcgoals g left join bcdow d on (g.bcdow = d.id)');
		return $niceViewA;
	}
	// 
	public function all() {
		$this->load();
		return $this->query;
	}

	public function add() {
		$this->copyFrom( 'POST' );
		$this->save();
	}

	public function getById( $id ) {
		$this->load( array( 'id=?', $id ) );
		$this->copyTo( 'POST' );
	}

	public function edit( $id ) {
		$this->load( array( 'id=?', $id ) );
		$this->copyFrom( 'POST' );
		$this->update();
	}

	public function delete( $id ) {
		$this->load( array( 'id=?', $id ) );
		$this->erase();
	}
}
