# Pokédex Flutter

Uma aplicação Flutter moderna para explorar o mundo dos Pokémon, utilizando a PokeAPI.


https://github.com/user-attachments/assets/1856d329-8e10-442f-ba50-1db81dde9664


## 🚀 Funcionalidades

- Lista completa de Pokémon
- Detalhes detalhados de cada Pokémon
- Interface moderna e responsiva
- Processamento assíncrono com Isolates
- Arquitetura limpa e organizada

## 📁 Estrutura do Projeto

```
lib/
├── core/
│   ├── app/
│   │   └── app_widget.dart      # Widget principal da aplicação
│   ├── routes/
│   │   └── app_routes.dart      # Gerenciamento de rotas
│   ├── theme/
│   │   └── app_theme.dart       # Configuração do tema
│   └── network/
│       └── api_client.dart      # Cliente HTTP
├── data/
│   ├── models/
│   └── repository/
├── di/
│   └── service_locator.dart     # Injeção de dependência
├── view/
│   └── screens/
└── viewmodel/
```

### Core
- **App**: Contém o widget principal da aplicação
- **Routes**: Gerenciamento centralizado de rotas
- **Theme**: Configuração do tema e estilos
- **Network**: Configurações de rede e API

## 🔄 Isolates

O projeto implementa Isolates do Dart para otimizar o processamento de dados pesados:

### PokemonIsolate
- Processa a lista de Pokémon em uma thread separada
- Converte os dados brutos da API em objetos `PokemonModel`
- Evita bloqueio da UI durante o processamento da lista

### PokemonDetailIsolate
- Processa os detalhes de um Pokémon específico
- Converte dados complexos em `PokemonDetailModel`
- Gerencia o parsing de tipos, habilidades e estatísticas

### Benefícios da Implementação
- Processamento paralelo de dados
- Interface do usuário sempre responsiva
- Melhor performance em dispositivos de baixo desempenho
- Redução do uso de memória na thread principal

## 🎨 Tema e Estilos

O projeto utiliza uma estrutura organizada para gerenciamento de tema:

### AppTheme
- Configuração centralizada do tema
- Suporte ao Material 3
- Estilos personalizados para componentes
- Tema consistente em toda a aplicação

### Componentes Estilizados
- AppBar com título centralizado
- Cards com bordas arredondadas
- Elevação e sombras consistentes
- Cores e tipografia padronizadas

## 🛣️ Gerenciamento de Rotas

Sistema de rotas organizado e centralizado:

### AppRoutes
- Constantes para nomes de rotas
- Mapa de rotas centralizado
- Fácil adição de novas rotas
- Navegação tipada e segura

## 🏗️ Arquitetura MVVM

O projeto segue o padrão de arquitetura MVVM (Model-View-ViewModel) com Clean Code:

### Model
- `PokemonModel`: Representa os dados básicos do Pokémon
- `PokemonDetailModel`: Contém informações detalhadas do Pokémon
- Responsável pela estrutura e validação dos dados

### View
- `PokemonListScreen`: Exibe a lista de Pokémon
- `PokemonDetailScreen`: Mostra detalhes de um Pokémon específico
- Componentes reutilizáveis e widgets personalizados
- Interface moderna e responsiva

### ViewModel
- `PokemonViewModel`: Gerencia o estado da lista de Pokémon
- `PokemonDetailViewModel`: Controla o estado dos detalhes
- Utiliza Riverpod para gerenciamento de estado
- Separação clara entre lógica de negócio e UI

## 📦 Pacotes Utilizados

### Gerenciamento de Estado
- **flutter_riverpod (^2.6.1)**
  - Gerenciamento de estado reativo
  - Injeção de dependência
  - Testabilidade

### Injeção de Dependência
- **get_it (^8.0.3)**
  - Service locator para injeção de dependência
  - Registro de serviços singleton
  - Fácil mock para testes

### Networking
- **dio (^5.8.0+1)**
  - Cliente HTTP robusto
  - Interceptors para logging
  - Tratamento de erros

### UI
- **flutter (SDK)**
  - Framework principal
  - Widgets Material Design
  - Animações e transições

## 🧪 Testes

O projeto possui uma cobertura abrangente de testes, seguindo as melhores práticas de TDD:

### Testes Unitários
- **ApiClient**
  - Testes de requisições HTTP bem-sucedidas
  - Testes de tratamento de erros
  - Testes de timeout

- **PokemonRepository**
  - Testes de busca da lista de Pokémon
  - Testes de busca de detalhes
  - Testes de tratamento de erros

- **ViewModels**
  - Testes de gerenciamento de estado
  - Testes de carregamento de dados
  - Testes de tratamento de erros

### Testes de Integração
- Testes de comunicação com a API real
- Testes de parsing de dados
- Testes de fluxo completo

### Estrutura de Testes
```
test/
└── unit/
    ├── core/
    │   ├── app/
    │   ├── routes/
    │   ├── theme/
    │   └── network/
    │       └── api_client_test.dart
    └── data/
        └── repository/
            └── pokemon_repository_test.dart
```

### Executando os Testes
```bash
# Executar todos os testes
flutter test

# Executar testes com cobertura
flutter test --coverage

# Executar testes específicos
flutter test test/unit/core/network/api_client_test.dart
```

## 📦 Instalação

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/pokedex-flutter.git
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o projeto:
```bash
flutter run
```

## 📱 Screenshots

[Adicione screenshots da aplicação aqui]

## 🤝 Contribuição

1. Faça um Fork do projeto
2. Crie uma Branch para sua Feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## ✨ Agradecimentos

- [PokeAPI](https://pokeapi.co/) - API de Pokémon
- [Flutter](https://flutter.dev/) - Framework
- [Dart](https://dart.dev/) - Linguagem
