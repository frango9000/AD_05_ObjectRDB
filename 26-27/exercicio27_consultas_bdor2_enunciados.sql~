        -----------------------------------------------------                        
 1. Consultar a definicion da taboa clientes.                                  

 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CLINUM                                    NOT NULL NUMBER
 CLINOMB                                            VARCHAR2(200)
 DIRECCION                                          DIRECCION_T
 LISTA_TEL                                          LISTA_TEL_T


!#
describe cliente_tab
     

-----------------------------------------------------
2. Inserir na taboa de clientes un nuevo cliente con todos os seus datos.(inventaos)

!#
INSERT INTO cliente_tab
	VALUES (
		5, 'Cliente 5',
		direccion_t('5 Calle Cinco', 'Cincos', 'CS', '12678'),
		lista_tel_t('555-555-5555')) ;


   -----------------------------------------------------                 
3. Consultar e modificar o nome do cliente numero 2  (debe pasar a chamarse 'Jorge Lampara')                           

!#
select clinomb from cliente_tab where clinum = 2;
update cliente_tab set clinomb = 'Jorge Lampara' where clinum = 2;



-----------------------------------------------------
4. Consultar e modificar o enderezo do cliente numero 2, que debera pasar a ser :
 '123 parchis','ceuta','ce','12345'                     

!#
select direccion from cliente_tab where clinum = 2; 
update cliente_tab set direccion = direccion_t( '123 parchis','ceuta','ce','12345') where clinum = 2;



-----------------------------------------------------
5. Consultar todos os datos do cliente numero 1 e engadir  un novo telefono a sua lista de telefonos.                                                         
  

!#
select * from cliente_tab where clinum=1;
select value(C) from cliente_tab C where C.clinum=1;
update cliente_tab set lista_tel=lista_tel_t('415-555-1212','6348635872') where clinum=1;


-----------------------------------------------------
6. Amosar somentes o nome do cliente que realizou o pedido numero 1001.    
              
Lola Caro  

!#                                                                     
select deref(cliente).clinomb from pedido_tab where ordnum = 1001;
select o.cliente.clinomb from pedido_tab o where o.ordnum=1001;


-----------------------------------------------------
7a.Visualizar todos os detalles do client que realizou o pedido numero 1001.       
     
                                                                          
CLIENTE_T(1, 'Lola Caro', DIRECCION_T('12 Calle Lisboa', 'Nules', 'CS', '12678')
, LISTA_TEL_T('415-555-1212', '6348635872'))                                    
                                                                  
!#        
select deref(cliente) from pedido_tab where ordnum = 1001;

                                                                  


-----------------------------------------------------
7b. amosar  o numero das lineas de pedido correspondentes a orde numero 3001.
                                                              
        30                                                                      
        32                                                                      

SQL> select cursor(select p.linum from Table(p.pedido)) from pedido_tab p where ordnum = 3001;



-----------------------------------------------------
7c. amosar codigo de cliente que fixo o pedido 3001                             
                                                      
       3    
        
SQL> select deref(cliente).clinum from pedido_tab where ordnum = 3001;




-----------------------------------------------------                                      
7d. amosar  o numero das lineas de pedidos correspondentes ao cliente de numero 3.           
                                                               

	34
	30
	32

SQL> select cursor(select p.linum from Table(o.pedido) p) from pedido_tab o where DEREF(o.cliente).clinum = 3;




-----------------------------------------------------
8. Visualizar o numero de todos los items que se han pedido en la orden numero  3001.

	3011
	1535

   
SQL> select cursor(select i.item.itemnum from Table(p.pedido) i) from pedido_tab p where ordnum = 3001;
                                                                 
     
