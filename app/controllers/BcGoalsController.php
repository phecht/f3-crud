<?php

class BcGoalsController extends Controller
{

    public function __construct()
    {
        parent::__construct();
/*         $bcgoal = new BCgoal( $this->db );
$bcdaily = new BCdaily( $this->dbbc ); */
    }

    public function index()
    {
        $niceView2 = $this->comboView();
        $this->f3->set('bcgoal2', $niceView2);

        $this->f3->set('page_head', 'Goals List');
        $this->f3->set('message', $this->f3->get('PARAMS.message'));
        $this->f3->set('view', 'bcgoal/list.htm');
        $this->f3->set('type', 'bcgoal');
    }

    /**
     * Create a new goal
     */
    public function create()
    {
        if ($this->f3->exists('POST.create')) {
            $bcgoal->add();

            $this->f3->reroute('/bcgsuccess/New Goal Created');
        } else {
            $this->f3->set('page_head', 'Create Goal');
            $this->f3->set('view', 'bcgoal/create.htm');
            $this->f3->set('type', 'bcgoal');
        }

    }

    public function update()
    {

        if ($this->f3->exists('POST.update')) {
            $bcgoal->edit($this->f3->get('POST.id'));
            $this->f3->reroute('/bcgsuccess/Date Updated');
        } else {
            $bcgoal = new BCgoal($this->db);
            $bcgoal->getById($this->f3->get('PARAMS.id'));
            $this->f3->set('user', $date);
            $this->f3->set('page_head', 'Update Date');
            $this->f3->set('view', 'bcgoal/update.htm');
            $this->f3->set('type', 'date');
        }

    }

    public function delete()
    {
        if ($this->f3->exists('PARAMS.id')) {
            $bcgoal->delete($this->f3->get('PARAMS.id'));
        }

        $this->f3->reroute('/bcgsuccess/Date Deleted');
    }
}
