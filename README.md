# Self-Hosted AI Dev Environment

Infraestrutura local para desenvolvimento com IA utilizando Vagrant, VirtualBox, Ubuntu Server, VSCode Remote SSH, Ollama e OpenClaude — sem dependência de APIs pagas e sem consumo de tokens externos.

Este projeto foi criado com foco em:

- DevOps
- Infraestrutura como Código (IaC)
- Ambiente reproduzível
- IA local com uso total do hardware
- Desenvolvimento remoto via VSCode
- Portfólio profissional para GitHub e entrevistas técnicas

---

# Arquitetura do Projeto

```text
self-hosted-ai-dev-environment/
│
├── Vagrantfile
│
├── provision/
│   ├── bootstrap.sh
│   ├── install_ollama.sh
│   ├── install_openclaude.sh
│   └── setup_env.sh
│
├── README.md
│
└── LICENSE
```

---

# Tecnologias Utilizadas

## Infraestrutura

- Vagrant
- VirtualBox
- Ubuntu Server 22.04 LTS

## Desenvolvimento

- Visual Studio Code
- Remote - SSH
- Git
- GitHub

## IA Local

- Ollama
- OpenClaude
- Qwen 2.5 Coder

---

# Pré-requisitos

Antes de iniciar, é necessário ter instalado no Windows:

- VirtualBox
- Vagrant
- Visual Studio Code
- Extensão VSCode: Remote - SSH

---

# Subindo a Máquina Virtual

Na raiz do projeto, execute:

```bash
vagrant up
```

Esse comando irá:

- Criar a VM Ubuntu Server
- Aplicar o provisionamento inicial
- Preparar o ambiente base para instalação da stack de IA local

---

# Conectando o VSCode via SSH à VM

## 1. Instalar a extensão Remote - SSH

No VSCode, instale a extensão:

**Remote - SSH**

Essa extensão permitirá utilizar a VM como ambiente principal de desenvolvimento.

---

## 2. Gerar a configuração SSH automática do Vagrant

No PowerShell, execute:

```bash
vagrant ssh-config
```

Esse comando exibirá a configuração correta da VM.

Exemplo:

```text
Host default
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile C:/Users/Assistencia/Documents/self-hosted-ai-dev-environment/.vagrant/machines/default/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
  PubkeyAcceptedKeyTypes +ssh-rsa
  HostKeyAlgorithms +ssh-rsa
```

---

## 3. Adicionar a configuração no arquivo SSH do Windows

Abra o arquivo:

```text
C:\Users\SEU_USUARIO\.ssh\config
```

Cole o conteúdo gerado pelo comando `vagrant ssh-config`.

Se o arquivo não existir, crie manualmente.

---

## 4. Conectar pelo VSCode

No VSCode:

- Clique no ícone de conexão remota
- Selecione a conexão SSH criada
- Escolha a VM

Agora o VSCode abrirá a VM como se fosse um ambiente local.

Você poderá utilizar:

- Terminal Linux
- Explorer de arquivos
- Git
- Extensões
- Debug
- Desenvolvimento completo dentro da VM

---

# Provisionamento Manual dos Scripts

## 1. Permissão de execução

Antes de rodar os scripts, execute:

```bash
chmod +x provision/*.sh
```

---

## 2. Ordem correta de execução

Execute exatamente nesta ordem:

```bash
./provision/bootstrap.sh
./provision/install_ollama.sh
./provision/install_openclaude.sh
./provision/setup_env.sh
```

Essa sequência garante:

1. Instalação da base do sistema
2. Instalação do Ollama
3. Instalação do OpenClaude
4. Configuração das variáveis de ambiente

---

# Configuração do Ambiente

## 1. Editar o arquivo `.bashrc`

Abra:

```bash
nano ~/.bashrc
```

---

## 2. Adicionar ao final do arquivo

```bash
export CLAUDE_CODE_USE_OPENAI=1
export OPENAI_BASE_URL="http://localhost:11434/v1"
export OPENAI_API_KEY="ollama"
export OPENAI_MODEL="qwen2.5-coder:7b"
```

---

## 3. Aplicar as alterações

```bash
source ~/.bashrc
```

---

# Inicializando o OpenClaude

Após toda a instalação:

```bash
openclaude
```

Se tudo estiver correto, o OpenClaude será iniciado utilizando o Ollama como backend local.

---

# Teste Inicial

Exemplo de prompt para validação:

```text
create a simple HTML page that says hello world
```

Outros testes úteis:

```text
create a bash script that shows disk usage
```

```text
create an ansible playbook to install nginx
```

---

# Acesso Manual via SSH (Opcional)

Caso deseje acessar a VM diretamente pelo terminal:

> É necessário estar na mesma pasta onde está o `Vagrantfile` (raiz do projeto)

```bash
ssh -i .\.vagrant\machines\default\virtualbox\private_key vagrant@192.168.57.10
```

Ou preferencialmente:

```bash
vagrant ssh
```

O comando `vagrant ssh` é mais confiável, pois utiliza automaticamente as configurações corretas da VM.

---

# Objetivo Final

Criar um laboratório profissional de IA local com:

- zero custo com tokens
- zero dependência de APIs pagas
- ambiente reproduzível
- desenvolvimento remoto via VSCode
- integração entre DevOps + IA + automação

Tudo rodando com recursos locais.

---

# Próximos Passos

Evoluções futuras planejadas:

- Ansible
- Docker
- Terraform
- CI/CD
- GitHub Actions
- Monitoramento
- Kubernetes

Transformando este laboratório em uma plataforma completa de engenharia e automação com IA local.

---

# Licença

Este projeto está sob a licença definida no arquivo `LICENSE`.

