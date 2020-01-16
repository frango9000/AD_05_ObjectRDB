/*
partimos de este codigo para crear unha base de datos seguindo o modelo obxecto relacional . Hai varios erros . tes que correxilos .

1.3.2.1. Implementación objeto relacional con Oracle
1.3.2.1.1. Creación de tipos
*/

DROP TABLE pedido_tab cascade constraints;
DELETE FROM cliente_tab;
DROP TABLE cliente_tab cascade constraints;
DELETE FROM item_tab;
DROP TABLE item_tab cascade constraints;
DROP TYPE pedido_t force;
DROP TYPE lineas_pedido_t force;
DROP TYPE linea_t force;
DROP TYPE item_t force;
DROP TYPE cliente_t force;
DROP TYPE lista_tel_t force;
DROP TYPE direccion_t force;

CREATE TYPE lista_tel_t AS VARRAY(10) OF VARCHAR2(20) ;
/
CREATE TYPE direccion_t AS OBJECT (
	calle VARCHAR2(200),
	ciudad VARCHAR2(200),
	prov CHAR(2),
	codpos VARCHAR2(20)
);
/
CREATE TYPE cliente_t AS OBJECT (
	clinum NUMBER,
	clinomb VARCHAR2(200),
	direccion direccion_t,
	lista_tel lista_tel_t
);
/
CREATE TYPE item_t AS OBJECT (
	itemnum NUMBER,
	precio NUMBER,
	tasas NUMBER
);
/
CREATE TYPE linea_t AS OBJECT (
	linum NUMBER,
	item REF item_t,
	cantidad NUMBER,
	descuento NUMBER
);
/
CREATE TYPE lineas_pedido_t AS TABLE OF linea_t;
/
CREATE TYPE pedido_t AS OBJECT (
	ordnum NUMBER,
	cliente REF cliente_t,
	fechpedido DATE,
	fechentrega DATE,
	pedido lineas_pedido_t,
	direcentrega direccion_t
);
/
/*
1.3.2.1.2. Creación de tablas objeto
Ahora vamos a crear las tablas donde almacenar los objetos de la aplicación.
*/
CREATE TABLE cliente_tab OF cliente_t
	(clinum PRIMARY KEY);
CREATE TABLE item_tab OF item_t
	(itemnum PRIMARY KEY) ;
CREATE TABLE pedido_tab OF pedido_t (
		PRIMARY KEY (ordnum),
		SCOPE FOR (cliente) IS cliente_tab
	)
	NESTED TABLE pedido STORE AS lineas_pedido_tab;

ALTER TABLE lineas_pedido_tab
	ADD (SCOPE FOR (item) IS item_tab);

/*
Esta última declaración sirve para restringir el dominio de los objetos referenciados desde item a
aquellos que se almacenan en la tabla item_tab.
1.3.2.2. Inserción de objetos
REM inserción en la tabla ITEM_TAB************************ 
*/
INSERT INTO item_tab VALUES(1004, 6750.00, 2);
INSERT INTO item_tab VALUES(1011, 4500.23, 2);
INSERT INTO item_tab VALUES(1534, 2234.00, 2);
INSERT INTO item_tab VALUES(1535, 3456.23, 2);
INSERT INTO item_tab VALUES(2004, 33750.00, 3);
INSERT INTO item_tab VALUES(3011, 43500.23, 4);
INSERT INTO item_tab VALUES(4534, 5034.00, 6);
INSERT INTO item_tab VALUES(5535, 34456.23, 5);
/*
REM inserción en la tabla CLIENTE_TAB*********************
Nótese cómo en estas definiciones se utilizan los constructores del tipo de objeto direccion_t y el
tipo de colección lista_tel_t.
*/
INSERT INTO cliente_tab
	VALUES (
		1, 'Lola Caro',
		direccion_t('12 Calle Lisboa', 'Nules', 'CS', '12678'),
		lista_tel_t('415-555-1212')) ;

INSERT INTO cliente_tab
	VALUES (
		2, 'Jorge Luz',
		direccion_t('323 Calle Sol', 'Valencia', 'V', '08820'),
		lista_tel_t('609-555-1212','201-555-1212')) ;

INSERT INTO cliente_tab
	VALUES (
		3, 'Juan Perez',
		direccion_t('12 Calle Colon', 'Castellon', 'ES', '12001'),
		lista_tel_t('964-555-1212', '609-543-1212','201-775-1212','964-445-1212')) ;
INSERT INTO cliente_tab
	VALUES (
		4, 'Ana Gil',
		direccion_t('5 Calle Sueca', 'Burriana', 'ES', '12345'),
		lista_tel_t()) ;
/*
REM inserción en la tabla PEDIDO_TAB***************************
Nótese cómo en estas definiciones se utiliza el operador REF para obtener una referencia a un objeto
de cliente_tab y almacenarlo en la columna de otro objeto de pedido_tab. La palabra clave THE se
utiliza para designar la columna de las tuplas que cumplen la condición del WHERE, donde se deben
realizar la inserción. Las tuplas que se insertan son las designadas por el segundo SELECT, y el
objeto de la orden debe existir antes de comenzar a insertar líneas de pedido.
REM Pedidos del cliente 1********************************** 
*/
INSERT INTO pedido_tab
	SELECT 1001, REF(C),SYSDATE,'10-MAY-1999',lineas_pedido_t(),NULL
	FROM cliente_tab C
	WHERE C.clinum= 1 ;

INSERT INTO THE (
		SELECT P.pedido
			FROM pedido_tab P
			WHERE P.ordnum = 1001
	)
	SELECT 01, REF(S), 12, 0
		FROM item_tab S
		WHERE S.itemnum = 1534;

INSERT INTO THE (
		SELECT P.pedido
			FROM pedido_tab P
			WHERE P.ordnum = 1001
	)
	SELECT 02, REF(S), 10, 10
		FROM item_tab S
		WHERE S.itemnum = 1535;

-- REM Pedidos del cliente 2************************************
INSERT INTO pedido_tab
SELECT 2001, REF(C),
SYSDATE,'20-MAY-1999',
lineas_pedido_t(),
direccion_t('55 Madison Ave','Madison','WI','53715')
FROM cliente_tab C
WHERE C.clinum= 2;
INSERT INTO THE (
SELECT P.pedido
FROM pedido_tab P
WHERE P.ordnum = 2001
)
SELECT 10, REF(S), 1, 0
FROM item_tab S
WHERE S.itemnum = 1004;
INSERT INTO THE (
SELECT P.pedido
FROM pedido_tab P
WHERE P.ordnum= 2001
)
VALUES( linea_t(11, NULL, 2, 1) ) ;
-- REM Pedidos del cliente 3************************************
INSERT INTO pedido_tab
SELECT 3001, REF(C),
SYSDATE,'30-MAY-1999',
lineas_pedido_t(),
NULL
FROM cliente_tab C
WHERE C.clinum= 3 ;
INSERT INTO THE (
SELECT P.pedido
FROM pedido_tab P
WHERE P.ordnum = 3001
)
SELECT 30, REF(S), 18, 30
FROM item_tab S
WHERE S.itemnum = 3011;
INSERT INTO THE (
SELECT P.pedido
FROM pedido_tab P
WHERE P.ordnum = 3001
)
SELECT 32, REF(S), 10, 100
FROM item_tab S
WHERE S.itemnum = 1535;
-- *****************************************
INSERT INTO pedido_tab
SELECT 3002, REF(C),
SYSDATE,'15-JUN-1999',
lineas_pedido_t(),
NULL
FROM cliente_tab C
WHERE C.clinum= 3 ;
INSERT INTO THE (
SELECT P.pedido
FROM pedido_tab P
WHERE P.ordnum = 3002
)
SELECT 34, REF(S), 200, 10
FROM item_tab S
WHERE S.itemnum = 4534;
-- REM Pedidos del cliente 4************************************
INSERT INTO pedido_tab
SELECT 4001, REF(C),
SYSDATE,'12-MAY-1999',
lineas_pedido_t(),
direccion_t('34 Nave Oeste','Nules','CS','12876')
FROM cliente_tab C
WHERE C.clinum= 4;
INSERT INTO THE (
SELECT P.pedido
FROM pedido_tab P
WHERE P.ordnum = 4001
)
SELECT 41, REF(S), 10, 10
FROM item_tab S
WHERE S.itemnum = 2004;
INSERT INTO THE (
SELECT P.pedido
FROM pedido_tab P
WHERE P.ordnum = 4001
)
SELECT 42, REF(S), 32, 22
FROM item_tab S
WHERE S.itemnum = 5535;
