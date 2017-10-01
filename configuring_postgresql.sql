--download postgresql for windows from: https://www.enterprisedb.com/postgresql-959-binaries-win32?ls=Crossover&type=Crossover
--initialize the server: initdb C:/java/servers/pgsql/data
--start the server:   pg_ctl -D "C:/java/servers/pgsql/data" -l logfile start
--create the database: createdb "dbLibrary"
--create the user:    createuser --interactive -l -P -s -d "admLibrary"
--connect to database: psql -d "dbLibrary" -U postgres
--grant all permissions to admLibrary on dbLibrary: GRANT ALL PRIVILEGES ON DATABASE "dbLibrary" to "admLibrary";

create table "Book" (
book_id varchar(10) not null primary key,
book_name varchar(30) not null,
author varchar(25),
publisher varchar(25),
date_of_publication date,
price numeric(10,2)
);


--Type \q to quit:\q
--test admLibrary user login: psql -d dbLibrary -U admLibrary

insert into "Book" values ('01110','danilo','eu','2017-08-01',30.00);
select * from "Book";


--create a phpinfo page to test:
<?php
phpinfo();
?>
--if the session for pgsql doesn't apeare than you'l need to add the instruction to the apache httpd.conf:
LoadFile "C:/Program Files (x86)/php/libpq.dll"
--https://stackoverflow.com/questions/7438059/fatal-error-call-to-undefined-function-pg-connect


--you'll need to configure tcpip for your postgresql server:
--edit your postgresql.conf  in your $PGDATA directory and add:
--tcpip_socket = true
--restart your server
cd C:\java\servers\pgsql\bin
pg_ctl -D "C:/java/servers/pgsql/data" -l logfile restart -s

--to find the current port and host that the database is running on:
SELECT * FROM pg_settings WHERE name = 'port';