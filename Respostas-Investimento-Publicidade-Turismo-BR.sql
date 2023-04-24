--Efetuando a limpeza: Excluindo as colunas vazias e linhas sem a formatação ideal

SELECT * 
FROM [marketing].[dbo].['FEVEREIRO PRODUÇÃO$'];

ALTER TABLE [marketing].[dbo].['FEVEREIRO PRODUÇÃO$']
DROP COLUMN F3, F4, F6, F7, F8, F10, F11, F12;

DELETE FROM [marketing].[dbo].['FEVEREIRO PRODUÇÃO$']
WHERE F1 IS NULL;

DELETE FROM [marketing].[dbo].['FEVEREIRO PRODUÇÃO$']
WHERE F1 = 'Contrato: 34/2017 e 35/2017';

DELETE FROM [marketing].[dbo].['FEVEREIRO PRODUÇÃO$']
WHERE F1 = 'AGÊNCIA';

-- OBS1: Posteriormente, renomeei cada coluna de forma manual para seguir o formato original.
-- OBS2: Exportei apenas a tabela tratada do relatório da produção de Fevereiro de 2020 e nomeei de "PROD.FEV.2020"
-- OBS3: Após a limpeza dos dados, iniciei com a resoluções do problemas.

--Qual foi o Investimento Total Bruto em Publicidade na Produção de Fevereiro de 2020 por Agência? 

SELECT AGÊNCIA, SUM(BRUTO) AS 'TOTAL BRUTO'
FROM [marketing].[dbo].['FEVEREIRO PRODUÇÃO$']
GROUP BY AGÊNCIA;


--Informe os 5 Maiores Investimentos em Publicidade na Produção de Fevereiro de 2020:

SELECT TOP 5 *
FROM [marketing].[dbo].['FEVEREIRO PRODUÇÃO$']
ORDER BY BRUTO DESC;


--Informe o Menor Investimento em Publicidade na Produção de Fevereiro de 2020:

SELECT TOP 1 *
FROM [marketing].[dbo].['FEVEREIRO PRODUÇÃO$']
ORDER BY BRUTO ASC;


--Qual foi o dia mais custoso de Fevereiro de 2020?

SELECT TOP 1 PAGAMENTO, SUM(BRUTO) AS 'TOTAL BRUTO'
FROM [marketing].[dbo].['FEVEREIRO PRODUÇÃO$']
GROUP BY PAGAMENTO
ORDER BY 'TOTAL BRUTO' DESC;


--Quais foram os Serviços/Fornecedores que ficaram Acima da Média de Investimento Bruto de Fevereiro de 2020? 

SELECT *
FROM [marketing].[dbo].['FEVEREIRO PRODUÇÃO$']
WHERE BRUTO > (SELECT AVG(BRUTO) FROM [marketing].[dbo].['FEVEREIRO PRODUÇÃO$'])
ORDER BY BRUTO DESC;


