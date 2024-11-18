drop user if exists kuramura;
create user kuramura identified by 'kuramura';
grant all on 'db_kuramura'.* to kuramura@localhost;
flush privileges;