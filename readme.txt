This applications use django and tastypie as the framework to build a RESTful API.  Please folow the directions at https://docs.djangoproject.com/en/1.6/topics/install/#installing-official-release to install django and https://django-tastypie.readthedocs.org/en/latest/tutorial.html to install tastypie.

install mysql and mysql_config
sudo apt-get install mysql
sudo apt-get install libmysqlclient-dev

Create the databases in mysql 
mysql -u*** -p*** 
CREATE DATABASE KE;
CREATE USER 'Kixeye'@'localhost' IDENTIFIED BY 'Kixeye';
GRANT ALL PRIVILEGES ON * . * TO 'Kixeye'@'localhost';

Sync the table to your new DB
python manage.py syncdb

You will need a sym link to tastypie
ln -s /usr/local/lib/python2.7/dist-packages/tastypie/ tastypie


To run the server use
python manage.py runserver

