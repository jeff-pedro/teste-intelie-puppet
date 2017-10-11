<h1>#Mysql Server com Puppet e Vagrant</h1>

* cria vm ubuntu server;

* instala de forma automatizada o mysql-server;

* cria o banco 'dbintelie';

* cria uma senha de acesso para o sgbd. ( user:administrator, pass: admin)

<b>OBS.:</b>

- o 'puppet' impede que o banco seja sobrescrito, caso ele já exista.
- impede que o comando responsável em alterar a senha seja executado, caso já exista.
- as depêndencias melhora a performance do código, pois evita execuções desnecessárias.
