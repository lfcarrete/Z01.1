# Lab 2: Github

Nesse laboratório iremos trabalhar com o uso do git de forma colaborativa.

!!! tip
    Aconselhável fazer no Linux, mas pode fazer no Windows

### Clonando

!!! warning "Individual"
    Todos do grupo devem realizar de maneira individual!

Uma vez criado o **fork** e adicionado os colegas vocês deverão clonar o repositório para o computador de vocês com o comando:

``` bash
$ git clone URL_DO_FORK
```

??? note "URL_DO_FORK"
    A URL do seu fork pode ser obtida pelo botão 'Clone or Download' do github: 
    ![](figs/A-Transistores/url-fork.png)

!!! linux 
    O símbolo `$` indica que é um comando para ser executado no 
    terminal do Linux (`bash`), mas ele não deve fazer parte do comando.
    No caso anterior, o comando a ser colado deve ser: `git clone URL_DO_FORK`.
    
!!! Linux
    Para abrir o terminal: `meta`+`t` 

## Adicionando nomes ao `INTEGRANTES.json`

!!! warning "Individual"
    Deve ser realizado individual por todos do grupo.

!!! tip
    Antes de começar, atualize seu repositório com o remote:
    
    ```bash
    $ git pull origin master
    ```
    
Nesse etapa cada integrante do grupo irá editar um arquivo no seu computador e realizar um pull-request para o repositório do grupo. Para isso seguiremos as etapas a seguir:

1. Gerar mudanças no repositório local
1. Criando um branch com as mudanças 
1. Enviar mudanças para o repositório remoto
1. Gerar pull-request

### Atualizando `INTEGRANTES.json`

**Cada integrante** do grupo deve editar o documento com na raiz do projeto com nome `INTEGRANTES.json` 
e adicionar a esse arquivo o seu nome, e-mail (insper) e usuário gituhb. Conforme o exemplo a seguir:

``` json
{
  "aluno-1": {
    "nome": "Rafae Corsi",
    "email-insper": "rafael.corsi@insper.edu.br",
    "user-github": "rafaelcorsi"
  },
```

!!! warning 
    Uma única pessoa não deve editar o documento com todos os nomes.
    
    - Cada um deve realizar individualmente em seu computador.

### Testando

A disciplina utiliza uma técnica chamada de ["Test Driven Development"](https://en.wikipedia.org/wiki/Test-driven_development) onde utilizamos de teste unitário e de integração para validarmos se a implementação está correta. 

Nesse caso, iremos utilizar um script para validar se o arquivo `.json` editado está com formatação correta. Para isso, execute no terminal:

```bash
$ ./Projetos/A-AmbienteDesenvolvimento/testeAmbienteDesenvolvimento.py
```

Você deve obter:

```
➜  Z01.1 git:(master) ✗ ./Projetos/A-AmbienteDesenvolvimento/testeAmbienteDesenvolvimento.py
===================================================
[OK] GRUPO.json
===================================================
===================================================
[OK] INTEGRANTES.json
===================================================
```

!!! warning
    Se obter **[FAIL]** em algum dos dois arquivos, editar o arquivo e executar a etapa anterior novamente. **Só continuar se não tiver falhas!**

### Criando um branch para fazer o commit.

A fim de realizarmos um pull-request ao mediador do projeto é preciso salvarmos essas modificações em um novo branch. O comando a seguir faz isso:

``` bash
$ # criando um novo branch
$ git checkout -B $NOME
```

!!! tip "git"
    Substitua nos comandos o termo `$NOME` pelo seu nome.

Agora vamos fazer um commit com o seu nome nesse novo branch:

``` bash
$ git add INTEGRANTES.json
$ git commit -m "Adicionado meu $NOME ao arquivo"
```

Será necessário enviarmos esse branch ao servidor (github) antes de realizarmos o `pull-request`:

``` bash
$ # enviando o branch para o repositório remoto
$ git push origin $NOME
```

!!! tip "git"
    Esse comando diz para o git que é para enviar o branch `$NOME` 
    para o repositório remoto `origin`. Aquele que aparece no comando `$ git remote -v`.

### Realizando pull-request

Uma vez enviando o branch para o servidor, podemos via a interface **web** do `github` realizar o `pull-request`. Abra a pagína do github do repositório do seu grupo. 

!!! tip "git"
    Se tiver instalado o software [`hub`](https://github.com/github/hub) digite na linha de comando: `$ hub browser`.

Vamos agora gerar o pull-request na interface do github, de forma similar ao exemplo a seguir:

!!! warning
    Cuidado! Escolher o seu repositório no momento de realizar o pullrequest.

![](figs/B-CI/pullrequest.gif)

!!! tip
    Ao realizar o PR, o `Travis` irá verificar o seu arquivo com o mesmo teste que você executou anteriormente, esse será o fluxo geral da disciplina, onde o mesmo teste é realizado local na máquina de cada aluno e remoto automaticamente pelo Travis.

## Aceitando pull-request

!!! warning "Apenas o mediador"
    Vocês devem escolher um do grupo para assumir o papel do mediador!

O **mediador** do projeto deve revisar os pull-requests (e corrigir eventuais erros de merge) 
e aceitar ou negar o pedido. 

![](figs/B-CI/pullrequest-accept.gif)
