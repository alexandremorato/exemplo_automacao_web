# Automação Web 

Esse projeto foi desenvolvido para rodar com Ruby, Capybara e Cucumber.

### Pré-requisitos

- Gerenciador de versões Ruby `v2.5.1`
- Bundler instalado `gem install bundler`
- Chrome Driver e Geckodriver 

#### Dica
Instalação `Geckodriver`
 ```
 wget https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz
 tar -xvzf geckodriver*
 chmod +x geckodriver 
 sudo mv geckodriver /usr/local/bin/
```

Instalação `Chrome Driver`
 ```
 wget https://chromedriver.storage.googleapis.com/81.0.4044.69/chromedriver_linux64.zip
 unzip chromedriver_linux64.zip
 chmod +x chromedriver 
 sudo mv chromedriver /usr/local/bin/
```

Tutorial para ajudar na instalação do RVM(Gerenciador de versões)
- [RVM](https://rvm.io/rvm/install)

Após concluir a instalação dos pré-requisitos, dentro do diretório do projeto de automação web, rodar o comando para instalação das dependências.

```
bundle install
```
### Para rodar os testes

- Execução utilizando tags (@login)
    ```
    Ex.: cucumber -t @login BROWSER=chrome 
    ```
- Execução em diferentes navegadores(BROWSER=chrome, BROWSER=firefox, BROWSER=chrome_headless)
    ```
    Ex.: cucumber -t @login BROWSER=firefox 
    ```    
- Foram criados alguns profiles para facilitar a execução dos testes e geração de relatórios, podem ser conferidos no arquivo `cucumber.yml` 
    ```
    Ex.: cucumber -p login -p chrome_headless
    ```
#### CI
No Jenkins executar as seguintes etapas: 
 - Criar um novo item
 - Pipeline
 - Em Pipeline escolher a definição `Pipeline script from SCM`
 - SCM - Github
 - Informar o github desse projeto e salvar

As definições do Pipeline estão no arquivo `Jenkinsfile`
