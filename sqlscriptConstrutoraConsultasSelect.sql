select CPF, Nome from Trabalhador where salario > 2500;

select C.Nome as Construtora, T.Nome as Trabalhador, T.Salario from Trabalhador T join Obra O
on T.fk_Obra_Codigo = O.Codigo join Construtora C
on O.fk_Construtora_Codigo = C.Codigo
where C.Nome like 'Nicolas'
order by T.Nome asc;

select O.Nome, sum(salario) as folha_de_pagamento from Trabalhador T 
join Obra O on T.fk_Obra_Codigo = O.Codigo 
group by O.Nome;

select sum(Valor_diaria) * 31 as Valor_Março from Categoria C 
join Equipamento E on C.Codigo = E.fk_Categoria_Codigo 
join Obra_Equipamento_aluga OE on E.Codigo = OE.fk_Equipamento_Codigo where data_inic <= '01-MAR-2022' and data_term >= '31-MAR-2022'