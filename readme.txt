This applications use django and tastypie as the framework to build a RESTful API.  Please folow the directions at https://docs.djangoproject.com/en/1.6/topics/install/#installing-official-release to install django and https://django-tastypie.readthedocs.org/en/latest/tutorial.html to install tastypie.


install mysql and mysql_config
sudo apt-get install mysql
sudo apt-get install libmysqlclient-dev


# Create a mysql database

`create database KE Character set utf8;`


BEGIN;
CREATE TABLE `users_users` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `firstName` varchar(100) NOT NULL,
    `lastName` varchar(100) NOT NULL,
    `nickName` varchar(100) NOT NULL,
    `wins` integer NOT NULL,
    `losses` integer NOT NULL,
    `winStreak` integer NOT NULL,
    `created` datetime NOT NULL,
    `last_seen` datetime NOT NULL
)
;

COMMIT;


You will need a sym link to tastypie
ln -s /usr/local/lib/python2.7/dist-packages/tastypie/ tastypie
