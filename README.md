# Blog_RoR

## Visão Geral

O projeto **Blog_RoR** é uma aplicação para a criação de blogs, no qual possui as funções de postar blogs e comentas em blogs. Construído em Ruby on Rails, Utiliza HTTP para interação com os dados, permitindo que diferentes tipos de usuários participem do ciclo de vida de um blog, desde sua criação até a coleta de comentários.

## Finalidade do Projeto

Este projeto foi desenvolvido com a finalidade de servir como teste para um processo seletivo de estágio. Ele demonstra o uso de tecnologias como Ruby on Rails e HTTP em um cenário de gerenciamento de blogs, com foco em funcionalidades de criação e comentários.

## Diagrama UML
<details>
  <summary>Clique para visualizar o diagrama UML</summary>

  ```mermaid
  erDiagram
    USER {
        int id
        string name
        string email
    }
    POST {
        int id
        int user_id
        string title
        text body
    }
    COMMENT {
        int id
        int user_id
        int post_id
        text content
    }

    USER ||--o{ POST: "tem"
    USER ||--o{ COMMENT: "tem"
    POST ||--o{ COMMENT: "tem"

  ````
</details>

## Funcionalidades

- **Usuários**:
  -  Cria, atualiza e exclui posts.
  -  Participam respondendo posts submetendo suas respostas.
  
- **Gerenciamento de Posts**:
  - Criação, atualização e exclusão de posts.
  - Visualização de posts.

- **Comentário**:
  - Submissão de comentários pelos usuarios.

- **Autenticação**:
  - Registro e login de usuários com lógica de cookie de sessões.

  **Foi feito os seguintes requisitos**
    ●ver os posts publicados por todos os usuários ordenados do mais novo para o
    mais antigo;
    ● os posts publicados devem ter paginação ao atingirem 3 publicações, onde o
    4o post irá para a página 2 e daí em diante, ou seja, cada página deverá ter até
    3 posts.
    ● fazer comentários anônimos;
    ● cadastrar um novo usuário;
    ● fazer login com um usuário cadastrado;
    ● recuperar a senha do usuário.
    ● redigir e publicar um post;
    ● editar e apagar posts já publicados pelo próprio usuário logado;
    ● fazer comentários identificados através do login;
    ● editar o seu cadastro de usuário;
    ● alterar a senha do usuário logado.

---

## Tecnologias Utilizadas

- **Ruby on Rails**
- **HTTP REQUEST**
- **Session Cookie**
- **PostgreSQL**
- **RSpec**
- **bcrypt**
- **factory-bot-rails**
- **Entre outras**
---

## Funcionalidades e Endpoints

**Endpoints**
GET:
/posts: Retorna todas as postagens.

/posts/:id: Retorna uma postagem específica pelo ID.

/users/:id/posts: Retorna as postagens criadas por um usuário específico.

/posts/:id/comments: Retorna os comentários associados a uma postagem específica.


POST:

/posts: Cria uma nova postagem.

/comments: Cria um novo comentário.

/users: Registra um novo usuário.


PUT:

/posts/:id: Atualiza uma postagem existente.

DELETE:

/posts/:id: Exclui uma postagem.

/comments/:id: Exclui um comentário.
---

## Instalação e Configuração

### Pré-requisitos

- **Ruby 3.3.5**
- **Rails 7**

### Passos para Configuração

1. Clone o repositório:
   ```bash
   git clone https://github.com/ReizeXD/Blog-RoR.git
   cd BlogRoR
   ````

2. Instale as Depedências
   ```bash
   bundle install
   ```
3. Configure o banco de dados:

  Edite o arquivo config/database.yml para incluir suas credenciais do PostgreSQL.
  Rode as migrações:
````bash
  rails db:create
  rails db:migrate
  ````
4. Carregue dados de exemplo (opcional):

````bash
rails db:seed
````
5. Inicie o servidor:

````bash
rails s
````

6. Acesse a aplicação no navegador:

  URL: http://localhost:3000/graphiql

Agora está pronto para utilizar a aplicação, inserindo as queries e mutations.
