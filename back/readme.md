## Para iniciar o projeto

Tenha o node instalado na sua máquina

Tenha o docker instalado na sua máquina para conseguir executar o banco de dados
Para baixar, faça o download nesse site abaixo
```
https://www.docker.com/products/docker-desktop/
```

dentro do projeto, execute o seguinte comando para criar o cluster Mysql
```
docker-compose up -d
```

em caso de versões mais recentes do docker 
```
docker compose up -d
```

Utilize o gerenciador de banco de dados da sua preferencia, abra uma conexão com o banco
```
USER = root
PASSWORD = Teste@123
URL= localhost
PORT = 3307
```
Crie um banco de dados com o nome: barber_appointment

Para instalar as dependencias do projeto, execute o comando:
```
npm i 
```

#### Criando as tabelas do banco de dados
Para realizar a criação das tabelas execute o seguinte comando:
```
npx run prisma migrate deploy
```


### Para executar o projeto
Dentro do seu terminal, rode o comando
```
npm run dev
```

## Rotas do projeto
- Busca de Slots<br>
Método: GET<br>
localhost:3000/slot?professionalId=1

- Busca de Agendamento por cliente<br>
Método: GET<br>
localhost:3000/schedule?userId=1

- Agendamento<br>
Método: POST<br>
localhost:3000/schedule<br>
com o seguinte corpo JSON
```
{
    "slotId": 1,
    "userId": 1
}
```