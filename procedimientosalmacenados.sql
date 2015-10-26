CREATE DEFINER=`root`@`localhost` PROCEDURE `p_comentar`(in v_comentario varchar(300),  in v_proyectoID INT(11), in v_socialID int(11) )
BEGIN
	declare usuarioID int(11);
    select u.usuarioID into usuarioID
    from usuario u
    where u.socialID=v_socialID;
    
	insert into comentario(comentario, valido, proyectoID, usuarioID)
    values(v_comentario,1,v_proyectoID,usuarioID);
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_create_project`(in v_nombre varchar(100), in v_descripcionLarga varchar(4000), in v_descripcionCorta varchar(200), in v_monto int(11), in v_diasvigencia int(11), in v_url_image varchar(200),IN v_categoria varchar(100), IN v_ciudad varchar(100), in v_estado varchar(100), in v_socialID int)
BEGIN
   	declare categoriaID , ciudadID,estadoID, usuarioID int;
    
    select cat.categoriaID into categoriaID
			from categoria cat
			where cat.nombre=v_categoria;
            
	select ci.ciudadID into ciudadID
			from ciudad ci
			where ci.nombre=v_ciudad;
            
	select e.estadoID into estadoID
			from estado e
			where e.nombre=v_estado;		

	select u.usuarioID into usuarioID
			from usuario u
			where u.socialID=v_socialID;
            
	insert into proyecto(nombre, descripcion_larga,descripcion_corta,monto,diasvigencia,
 						url_image, categoriaID, ciudadID, estadoID, usuarioID, fecha_registro)
 	values(v_nombre,v_descripcionLarga,v_descripcionCorta,v_monto,v_diasvigencia,v_url_image,categoriaID,ciudadID,estadoID,usuarioID,curdate())
 	;			
END