https://github.com/phecht/f3-crud (Uses postgres and needs to setup .env2 and or set using heroku config commands. )

[![Fat-Free Framework](ui/images/logo.png)](http://fatfree.sf.net/)

*A powerful yet easy-to-use PHP micro-framework designed to help you build dynamic and robust Web applications - fast!*

For details visit [http://foysalmamun.wordpress.com/](http://foysalmamun.wordpress.com/2013/03/27/fat-free-crud-with-mvc-tutorial/).

To create a new CRUD for a table:
1. Make a DB script in db/.
2. Copy a section of the routes.ini and change names of controller and route. 
3. Make a copy of a model.
  1. Change name to match DB name.  Change the name in two places.
4. Make a copy of a controller. 
  1.  Rename to name in routes.ini
  2. Update to have a constructor.  Put call to create model in constructor.  
  3. Change names to fit new model and routes. 
5. Copy a view folder to a non plural name and change DB field names to the ones needed.
6. Added needed links to newheader2.htm
7. Create a dashlist.htm for use in the dashboard.

