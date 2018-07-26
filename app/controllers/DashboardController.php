<?php

class DashboardController extends Controller {

	public function index() {

	
		$this->f3->set( 'page_head', 'Dashboard' );
		$this->f3->set( 'view', 'dashboard/home.htm' );
		$this->f3->set( 'type', 'dashboard' );
		$event = new Event( $this->db );
		$this->f3->set( 'dashevents', $event->dashdisplay() );
/* 		$workshiftv = $this->db->exec(
		'select w.id, w.startwork, w.endwork, u.name from workshifts w left join users u ON(u.id = w.userid) order by w.startwork' );
 */		
		// dorder, dow,  wname, starthour, startAMPM, endhour, endAMPM
//		$wks1 = $this->db->exec('select dow as dayofw, wname, starthour, startAMPM, endhour, endAMPM from wks ');
		$wks1 = $this->db->exec("select dow as dayofw, wname, concat(starthour, startAMPM) as starth, concat(endhour, endAMPM) as endh from wks ");

		$weekdays['Monday'] = 'Monday: ';
		$weekdays['Tuesday'] = 'Tuesday: ';
		$weekdays['Wednesday'] = 'Wednesday: ';
		$weekdays['Thursday'] = 'Thursday: ';
		$weekdays['Friday'] = 'Friday: ';
		$weekdays['Saturday'] = 'Saturday: ';
		$weekdays['Sunday'] = 'Sunday: ';

		foreach ($wks1 as $shift) {
			$weekdays[$shift['dayofw']] = $weekdays[$shift['dayofw']] 
				. ' ' . $shift['wname'] . ' ' . $shift['starth'] . ' '  . '-' . $shift['endh'];
		}

		$this->f3->set( 'dashworks', $weekdays );
		$bcnote = new BCnote( $this->db );
		$this->f3->set( 'bcnotes', $bcnote->all() );
		$bcgoal = new BCgoal( $this-> db );
		$this->f3->set( 'bcgoals', $bcgoal->niceView());
		$bcdaily = new BCdaily( $this->dbbc);
		$niceView2 = $this->comboView();
		$this->f3->set( 'bcgoal2', $niceView2 );
		//print_r( $niceView2 );
		

	}




}
