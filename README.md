# Pokédex Flutter

![Flutter](https://img.shields.io/badge/Flutter-2.0.0-blue)
![Dart](https://img.shields.io/badge/Dart-2.12.0-blue)
![License](https://img.shields.io/badge/License-MIT-green)

Uma aplicação Flutter moderna que consome a [PokéAPI](https://pokeapi.co/) para exibir informações sobre Pokémon. O projeto foi desenvolvido seguindo as melhores práticas de arquitetura e desenvolvimento.

## 🎯 Objetivos

- Demonstrar a implementação de uma arquitetura MVVM (Model-View-ViewModel) em Flutter
- Utilizar gerenciamento de estado com Riverpod
- Implementar injeção de dependência
- Seguir princípios SOLID e Clean Code
- Criar uma interface de usuário moderna e responsiva

## 🏗️ Arquitetura

### MVVM (Model-View-ViewModel)

A arquitetura MVVM foi escolhida pelos seguintes motivos:

- **Separação de Responsabilidades**: Cada camada tem uma responsabilidade bem definida
- **Testabilidade**: Facilita a escrita de testes unitários
- **Manutenibilidade**: Código mais organizado e fácil de manter
- **Reutilização**: Componentes podem ser reutilizados em diferentes partes do app

#### Camadas:

1. **Model**
   - Representa os dados e a lógica de negócios
   - Classes: `PokemonModel`, `PokemonDetailModel`
   - Responsável por mapear os dados da API

2. **View**
   - Interface do usuário
   - Screens: `PokemonListScreen`, `PokemonDetailScreen`
   - Widgets reutilizáveis: `PokemonCardContainer`, `PokemonAppBar`
   - Responsável pela apresentação

3. **ViewModel**
   - Gerencia o estado e a lógica de apresentação
   - Classes: `PokemonViewModel`, `PokemonDetailViewModel`
   - Responsável por transformar dados do Model para a View

## 📦 Pacotes Utilizados

### Gerenciamento de Estado
- **flutter_riverpod**: Escolhido por ser uma solução moderna e type-safe para gerenciamento de estado
  - Facilita o teste de componentes
  - Permite injeção de dependência
  - Suporte a estados assíncronos

### Injeção de Dependência
- **get_it**: Utilizado para injeção de dependência
  - Simples e eficiente
  - Não requer anotações
  - Fácil de testar

### Networking
- **dio**: Cliente HTTP robusto
  - Suporte a interceptors
  - Tratamento de erros
  - Tipagem forte

## 🎨 Interface do Usuário

### Componentes Principais

1. **PokemonListScreen**
   - Lista de Pokémon com scroll infinito
   - Cards com informações básicas
   - Navegação para detalhes

2. **PokemonDetailScreen**
   - Detalhes completos do Pokémon
   - Imagem do Pokémon
   - Informações como altura, peso e tipos

### Widgets Reutilizáveis

1. **PokemonCardContainer**
   - Card estilizado para exibição de Pokémon
   - Animações suaves
   - Design responsivo

2. **PokemonAppBar**
   - Barra de navegação personalizada
   - Título dinâmico
   - Estilo consistente

## 🧪 Testes

O projeto inclui testes unitários abrangentes:

- Testes de Models
- Testes de ViewModels
- Testes de Repository
- Testes de integração com a API

## 🚀 Como Executar

1. Clone o repositório
```bash
git clone https://github.com/seu-usuario/pokedex-flutter.git
```

2. Instale as dependências
```bash
flutter pub get
```

3. Execute o app
```bash
flutter run
```

## 📱 Funcionalidades

- Lista de Pokémon com paginação
- Detalhes completos de cada Pokémon
- Interface responsiva
- Tratamento de erros
- Loading states
- Cache de imagens

## 🛠️ Estrutura de Diretórios

```
lib/
├── core/
│   ├── network/
│   └── utils/
├── data/
│   ├── models/
│   └── repository/
├── di/
├── view/
│   ├── screens/
│   └── widgets/
└── viewmodel/
```

## 🤝 Contribuindo

1. Faça um Fork do projeto
2. Crie uma Branch para sua Feature (`git checkout -b feature/AmazingFeature`)
3. Faça o Commit das suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Faça o Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👨‍💻 Autor

Seu Nome - [@felipeangeli](https://github.com/seu-usuario)

## 🙏 Agradecimentos

- [PokéAPI](https://pokeapi.co/) pela API gratuita
- Comunidade Flutter pelo suporte
- Todos os contribuidores do projeto
