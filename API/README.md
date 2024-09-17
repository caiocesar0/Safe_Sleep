# SafeSleep Login API

## Descrição

A API SafeSleep Login permite realizar operações de cadastro, login e alteração de senha de usuários. O projeto é uma aplicação Spring Boot que utiliza JPA para persistência de dados e MySQL como banco de dados.

## Requisitos

- Java 21
- Maven

## Dependências

O projeto utiliza as seguintes dependências:

- **Spring Boot Starter Data JPA**: Para integração com o banco de dados usando JPA.
- **MySQL Connector/J**: Para a conexão com o banco de dados MySQL.
- **Lombok**: Para simplificar o código, fornecendo anotações para geração automática de getters, setters, e outros métodos.
- **ModelMapper**: Para a conversão entre DTOs e modelos.
- **Spring Boot Starter Web**: Para a criação de endpoints REST.
- **Spring Boot Starter Test**: Para testes.

## Configuração

1. **Banco de Dados**

   Certifique-se de que o MySQL está instalado e em execução. Configure a URL de conexão, nome do banco de dados, usuário e senha no arquivo `application.properties` ou `application.yml` na pasta `src/main/resources`.

   A criação do Database e tables, acontecem automaticamente com a execução da API

3. **Executando o Projeto**

   Para construir e executar o projeto, use os seguintes comandos Maven:

   ```bash
   mvn clean install
   mvn spring-boot:run

4. **Porta LocalHost**
   Certifique-se que a portal localhost:8080 esteja livre para executar o build

## Observação

1. **Testes via postman:**
   Importe as collections "Safe Sleep Collections.postman_collection" na raíz do projeto para o seu postman


