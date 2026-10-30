# Atividade Prática: Formulário de Cadastro de Usuário em Flutter 📱

Projeto desenvolvido como atividade prática para aplicação dos conceitos de formulários, validações e feedback ao usuário no framework **Flutter** com **Dart**.

---

## 🎯 Objetivo

Implementar uma tela completa de cadastro de usuário no Flutter capaz de:
- Capturar dados digitados pelo usuário com controllers.
- Aplicar filtros de entrada restritivos (`inputFormatters`) e teclados especializados (`keyboardType`).
- Validar as regras de negócio campo a campo (`validator`).
- Exibir mensagens de erro abaixo de cada campo inválido.
- Fornecer feedback visual de sucesso via `SnackBar` quando todos os campos estiverem válidos.

---

## 📋 Campos e Regras de Validação

| Campo | Observação | Restrição de Entrada / Formatter | Regra de Validação |
|---|---|---|---|
| **Nome completo** | Texto livre | Teclado padrão / Nome | Campo obrigatório (não pode ser vazio) |
| **E-mail** | Deve conter `@` | `TextInputType.emailAddress` | Obrigatório + conter o caractere `@` |
| **CPF** | Apenas números | `FilteringTextInputFormatter.digitsOnly` | Obrigatório + apenas números |
| **Telefone** | Apenas números | `FilteringTextInputFormatter.digitsOnly` | Obrigatório + apenas números |
| **Senha** | Mínimo de 6 caracteres | `obscureText: true` (com alternância) | Obrigatório + tamanho >= 6 caracteres |

---

## 🏗️ Estrutura da Árvore de Widgets

O projeto segue à risca a hierarquia obrigatória solicitada:

```text
Scaffold
└── Form(key: _formKey)
    └── SingleChildScrollView (com padding de 16)
        └── Column
            ├── TextFormField (nome)
            ├── SizedBox(height: 16)
            ├── TextFormField (e-mail)
            ├── SizedBox(height: 16)
            ├── TextFormField (CPF)
            ├── SizedBox(height: 16)
            ├── TextFormField (telefone)
            ├── SizedBox(height: 16)
            ├── TextFormField (senha)
            ├── SizedBox(height: 16)
            └── ElevatedButton (CADASTRAR)
```

### Detalhes de Usabilidade:
- **`SingleChildScrollView`**: Previne erros de overflow de tela quando o teclado virtual é exibido.
- **`SizedBox(height: 16)`**: Garante espaçamento uniforme e legibilidade entre todos os campos e o botão.
- **`Padding`**: Espaçamento lateral e vertical de 16 pixels ao redor do formulário.
- **Visibilidade de senha**: Ícone interativo para alternar visualização do texto da senha.
- **`FocusScope.of(context).unfocus()`**: Recolhe o teclado ao clicar no botão de cadastro.

---

## 🚀 Como Executar o Projeto

### Pré-requisitos
- [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado.
- Emulador Android/iOS configurado, dispositivo físico conectado ou navegador Chrome.

### Passos:
1. Abra o terminal na pasta do projeto:
   ```bash
   cd "atividade flutter"
   ```

2. Baixe as dependências do Flutter:
   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:
   ```bash
   flutter run
   ```

4. Para rodar os testes unitários e de widgets:
   ```bash
   flutter test
   ```

---

## 📤 Como subir este projeto no GitHub

Caso ainda não tenha inicializado o Git neste repositório:

1. No terminal da pasta do projeto, execute:
   ```bash
   git init
   git add .
   git commit -m "feat: implementa formulario de cadastro de usuario em Flutter"
   ```

2. Crie um repositório no seu GitHub (ex: `atividade-flutter-cadastro`).

3. Vincule e envie os arquivos:
   ```bash
   git branch -M main
   git remote add origin https://github.com/SEU-USUARIO/SEU-REPOSITORIO.git
   git push -u origin main
   ```
*(Alternativamente, você pode abrir o [GitHub Desktop](https://desktop.github.com/) e adicionar esta pasta via `File > Add local repository` ou arrastar os arquivos para o repositório no site do GitHub).*
