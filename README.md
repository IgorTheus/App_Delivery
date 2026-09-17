# TechTaste

App de delivery desenvolvido em Flutter. *(nome provisório)*

## Infos

- Flutter/Dart
- Provider: gerenciamento de estado (dados de restaurantes, carrinho/sacola)

## Estrutura de pastas

```
lib/
├── data/
│   ├── categories_data.dart      # lista fixa de categorias (Petiscos, Bebidas...)
│   └── restaurant_data.dart      # provider com a lista de restaurantes
├── model/
│   ├── dish.dart                 # model de prato/bebida (id, nome, preço, imagem...)
│   └── restaurant.dart           # model de restaurante (dishes + drinks + categories)
├── ui/
│   ├── _core/
│   │   ├── app_colors.dart       # paleta de cores do app
│   │   ├── app_theme.dart        # ThemeData global
│   │   └── appbar.dart           # AppBar compartilhada entre telas
│   └── widgets/
│       ├── home/
│       │   ├── home_screen.dart
│       │   └── widget/
│       │       ├── category_widget.dart
│       │       └── restaurant_widget.dart
│       ├── categories/
│       │   └── category_screen.dart   # lista restaurantes filtrados por categoria
│       ├── restaurant/
│       │   └── restaurantscreen.dart  # cardápio (pratos + bebidas) de um restaurante
│       ├── splash/
│       │   └── splash_screen.dart
│       ├── checkout/
│       └── bag_provider.dart          # estado do carrinho/sacola
└── main.dart
```

## Funcionalidades atuais

- Splash screen com navegação para a Home
- Home com saudação, busca (visual, sem lógica ainda), categorias e lista de restaurantes bem avaliados
- Navegação por categoria: cada categoria mostra os restaurantes que a servem
- Tela de restaurante com cardápio separado em **pratos** e **bebidas**
- Adicionar itens à sacola (`BagProvider`)

## Como rodar

```bash
flutter pub get
flutter run
```

Se o app parar de responder no meio do desenvolvimento (comum no Windows com o Dart Development Service):

```bash
flutter clean
flutter pub get
```
