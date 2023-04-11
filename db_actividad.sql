delimiter //
create procedure clientes_modelo_de_coches ()
begin 
select cl.nombre, c.modelo, c.matricula
from clientes cl
join coches c on cl.NIT_C = c.NIT_C;
end //