drop type tipo_equipo force;
drop table taboa_equipos cascade constraints;
create type tipo_equipo as object(
	id_equipo number,
	nome varchar2(20),
	data_creacion date,
	posicion number;
);
/
create table taboa_equipos of tipo_equipo;

