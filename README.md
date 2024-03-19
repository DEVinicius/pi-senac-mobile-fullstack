# pi-mobile-senac

Grupo Projeto Integrador:

- Eduardo da Silva dos Santos | [eduardeveloper](https://github.com/eduardeveloper)
- Mateus da Silva Maciel | [mateus1315](https://github.com/mateus1315)
- Celso Frederico Gauz Alvez | [RicoGauz](https://github.com/RicoGauz)
- Vinicius Pereira de Oliveira | [DEVinicius](https://github.com/DEVinicius)
- Cleiton Sampaio da Silva
- Samuel Willians de Souza | [samuelwsouza](https://github.com/samuelwsouza)

<br/>

Histórico de colaborações

- Front-end | Flutter | Dart (Mateus)
- Back-end | Node.js | Express.js | MySQL (Vinicius)
- Prova de Conceito (Celso)
- Suporte (Cleiton)
- Suporte (Eduardo)
- GitHub (Samuel)

<br/>

Neste espaço, embarcamos em uma jornada emocionante, focada no aprimoramento da experiência de agendamento de cortes de cabelo. Reconhecendo não apenas a sua importância prática, mas também sua profunda relação com a missão central de nosso aplicativo, optamos por tornar este processo o objeto de nossa prova de conceito.

A prova de conceito de nosso aplicativo Simple Cut foi meticulosamente desenvolvida, impulsionada pela inovação. Utilizando as tecnologias de ponta, como Flutter para o frontend, NodeJs para o backend e MySQL como banco de dados, criamos uma solução que não apenas enfrenta desafios técnicos, mas também abraça a visão de simplificar e aprimorar a vida de nossos usuários.

<br/>

<p align="center">
  <img src="https://media.discordapp.net/attachments/1105674134647734292/1219422675194089532/22fc45a5-e07f-45c6-a414-73549ebd1f15.png?ex=660b3edd&is=65f8c9dd&hm=900947be4d5147ef25b627230b866635555a12a05c5148337b0e627421ea9188&=&format=webp&quality=lossless&width=753&height=468" alt="Texto Alternativo">
</p>

<br/>

<div align="center">

## Vídeo PI | Youtube | Clique na imagem abaixo


  [![VideoYoutubePI](https://github.com/samuelwsouza/pi-mobile-senac/assets/83421432/1f4d53de-a18b-4702-887a-bfddf316a7d4)
  ](https://youtube.com/shorts/aljFezFIBmM?feature=share)

</div>


<br/>
<br/>

<h3 align="center">Prova de Conceito App Simple Cut</h3>

Após revisitarmos nosso projeto de App apresentado na 1ª etapa deste Projeto Integrador, definimos a jornada referente ao agendamento de cortes de cabelo como objeto da prova de conceito a ser desenvolvida, não apenas por se tratar da principal dificuldade identificada, mas também por sua estreita relação com a missão do aplicativo.
Isto posto, a prova de conceito de nosso App Simple Cut, abaixo demonstrada, foi elaborada com a utilização das tecnologias Flutter (frontend), NodeJs (backend) e MySQL (Banco de Dados), sendo o projeto completo posteriormente disponibilizado via GitHub (https://github.com/samuelwsouza).
Adicionalmente, fazemos a ressalva de que, como se trata de uma prova de conceitos, algumas funcionalidades não foram totalmente implementadas ou foram implementadas de forma reduzida.

<br/>

 <h3 align="center">Para obter o projeto</h3>

Passo 1: Clone o repositório
Vá para a página do repositório do GitHub que contém o projeto Flutter.
Clique no botão "Code" e copie o URL fornecido.
Abra o terminal ou prompt de comando em seu computador.
Navegue até o diretório onde você deseja clonar o projeto.
Execute o seguinte comando para clonar o repositório:

```
git clone https://github.com/samuelwsouza/pi-mobile-senac.git
```

<br/>

Passo 2: Instale as dependências do projeto
Navegue para o diretório do projeto clonado:

```
cd pi_simplecut
```

Execute o comando flutter pub get para instalar todas as dependências necessárias do projeto Flutter.

<br/>

Passo 3: Execute o aplicativo
Agora que todas as dependências foram instaladas, você pode executar o aplicativo Flutter. Certifique-se de ter um emulador configurado ou um dispositivo físico conectado.
Execute o comando flutter run no terminal ou prompt de comando dentro do diretório do projeto.
Isso iniciará o processo de compilação e execução do aplicativo no emulador ou dispositivo conectado.

```
flutter run
```

<br/>

<h3>Rotas do projeto</h3>
- Busca de Slots<br>
Método: GET
localhost:3000/slot?professionalId=1

<br/>

<h3>Agendamento</h3>
Método: POST
localhost:3000/schedule
