queremos crear unha base obxecto relacional en base aos cos seguintes tipos de objectos :
lista_tel_t:  un varray de ata 10 numeros de telefono de 20 caracres cada  
direccion_t;  un tipo obxecto para almacenar os datos de enderezos cos seguintes campos:
	calle : 200 caracteres
	ciudad : 200 caracteres
	prov : provincia con  2 caracteres
	codpos: 20 caractres ;
cliente_t; un tipo obxecto para almacenar os datos de clientes cos seguintes campos:
	clinum , contera o numero do cliente de tipo number
	clinomb,  contera o nome do cliente de tipo 200 caracteres
	direccion, contera o enderezo do cliente de tipo direccion_t,
	lista_tel, contera os telefonos dos clientes de tipo lista_tel_t ;
item_t: un tipo obxecto para almacenar os datos de produtos  cos seguintes campos:
	itemnum, contera o numero do produto de tipo number
	precio,  contera o precio do produto de tipo NUMBER,
	tasas, contera as tasas do produto de tipo NUMBER) ;
linea_t:un tipo obxecto para almacenar unha linea de pedido cos seguintes campos:
	linum, contera o numero dunha linea dun pedido de tipo number
	item , contera unha referencia ao item ao que se refire unha linea de pedido, de tipo item_t
	cantidad, contera o numero de items do produto ao que se refire unha linea de pedido , tipo number 
	descuento, contera o desconto aplicado a linea de pedido , tipo number
lineas_pedido_t : un tipo obxecto para almacenar unha taboa que e un conxunto das lineas de pedidos , de tipo linea_t
pedido_t:  un tipo obxecto para almacenar un pedido 
	ordnum contera  o  numero do pedido de tipo NUMBER,
	cliente  contera a referencia a o cliente que fixo o pedido, de tipo cliente_t
	fechpedido , contera a data do pedido,  de tipo Date
	fechentrega , contera a data da entrga do pedido, de tipo date
	pedido , contera al lineas do pedido , de tipo lineas_pedido_t
	direcentrega , contera o enderezo de entrega do pedido, de tipo direccion_t

crearemos tres taboas que utilizan estes tipos de obxectos

cliente_tab de tipo cliente_t que usara como clave primaria o campo clinum
item_tab de tipo tiem_t que usara como clave primaria o campo itemnum
pedido_tab de tipo pedido_t que usara como clave primaria o campo ordnum e usara como referencia para o seu campo cliente a taboa cliente_tab en modo SCOPE. tamen indicaremos nesta taboa que as lineas de pedido deste pedido (campo pedido) seran almacenadas na tabo anidada lineas_pedido_tab.

alteramos a tabla lineas_pedido_tab para indicar que a referencia do campo item e a taboa item_tab


