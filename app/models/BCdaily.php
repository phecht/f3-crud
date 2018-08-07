<?php

class BCdaily extends DB\SQL\Mapper
{
    public function __construct(DB\SQL $dbbc)
    {
        parent::__construct($dbbc, 'barcarresults');
    }



    public function last7()
    {
        // $this->load();
        $last7 = $this->db->exec(
            'select Dayname( DateOfEntry ) as dow, NetSales, ' .
            ' ClosingBarTender, OtherBartenders, DateofEntry' .
            ' from barcarresults ORDER BY DateOfEntry DESC LIMIT 7;'
        );


        $last7 = $this->daterange($last7);
        return $last7;
    }

    /**
     * Check $last7 for missing dates.
     * Uses the array_splice to add dates if needed.
     * Then chop off the end to avoid last weeks result.
     * Then returns an array
     *
     * @parameters $last7
     * @return array
     **/
    public function daterange( $last7 )
    {
        $today = getdate();

        // print('last7:<p/>');
        // print_r($last7);
        // print('<p/>');
        $begin = new DateTime(strtotime($today['month'] . '/' . $today['mday'] .
         '/' . $today['year']));
        $begin = $begin->modify('-7 day');


        // check to make sure we didn't miss a date.
        // Is date in last7?  If so, do nothing. If not add it.

        // Keep track of missing dates with $missingCount.
        $missingCount=0;
        for ( $daycount = 0; $daycount<7; $daycount++) {
          $newValue = $begin->format('Y-m-d' );
          $dow = date('l', strtotime( $begin->format( 'Y-m-d' )));

          // Brute force to see if we have the date.
          $isMissing = true;
          foreach ($last7 as $key => $value) {
            // If we have one, set $isMissing to false and break.
            if ($value['DateofEntry'] == $begin->format('Y-m-d')) {
              // We have the date, exit.
              $isMissing = false;
              break;
            }
          }

          // If $isMissing, then we need to add it.
          if ($isMissing) {
            // Create a blank array with dow and DateofEntry.
            $missingDay = array( "$daycount" => array('dow' => $dow,
            'NetSales' => 0.00, 'ClosingBarTender' => "N/A",
            'OtherBartenders'=>"N/A",
            'DateofEntry' => $begin->format('Y-m-d')));
            // Splice it into the last7.
            array_splice ( $last7, $missingCount, 0, $missingDay );
            $missingCount++;
          }
          // Check the next day.
          $begin->modify('+1 day');
        }

        // Now $last7 has more than seven by $missingCount.
        array_splice( $last7, -$missingCount);
        // print( '<p/>missing<p/>');
        // print_r($missing);
        // print( '<p/>');
        // print( 'result<p/>');
        // print_r($result);
        // print( '<p/>');
        // print( 'last7<p/>');
        // print_r($last7);
        // print( '<p/>');

        // return the last7.
        return $last7;
    }
}
