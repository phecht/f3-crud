<?php

class BCdaily extends DB\SQL\Mapper {

	public function __construct( DB\SQL $dbbc ) {
		parent::__construct( $dbbc, 'barcarresults' );		
	}



	public function last7() {
		// $this->load();
		$last7 = $this->db->exec(
			'select Dayname( DateOfEntry ) as dow, NetSales, ' . 
			' ClosingBarTender, OtherBartenders' .
			' from barcarresults ORDER BY DateOfEntry DESC LIMIT 7;');
		return $last7;
	}
/* 
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
	} */
}
