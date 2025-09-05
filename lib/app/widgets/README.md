# GenericSection - Seção Genérica Reutilizável

## 📋 Visão Geral

A `GenericSection` é um widget Flutter reutilizável que padroniza a criação de seções em páginas web responsivas. Ela elimina a duplicação de código e mantém consistência visual entre diferentes seções.

## 🚀 Características

- ✅ **Responsivo**: Adapta-se automaticamente para mobile e web
- ✅ **Customizável**: Múltiplas opções de personalização
- ✅ **Reutilizável**: Use para qualquer tipo de seção
- ✅ **Consistente**: Mantém o mesmo estilo visual
- ✅ **Flexível**: Suporta diferentes layouts e conteúdos

## 📱 Parâmetros Disponíveis

### Parâmetros Obrigatórios
- `title` (String): Título da seção
- `content` (String): Conteúdo textual da seção

### Parâmetros Opcionais
- `photo` (String?): Caminho para a imagem (opcional)
- `photoBorderColor` (Color?): Cor da borda da foto
- `photoWidth` (double): Largura da foto (padrão: 250)
- `contentAlignment` (CrossAxisAlignment): Alinhamento do conteúdo
- `showDivider` (bool): Mostra/esconde o divisor (padrão: true)
- `dividerIndent` (double): Indentação esquerda do divisor (padrão: 100)
- `dividerEndIndent` (double): Indentação direita do divisor (padrão: 100)

## 💡 Exemplos de Uso

### 1. Seção Simples
```dart
GenericSection(
  title: 'Minha Seção',
  content: 'Conteúdo da seção aqui.',
)
```

### 2. Seção com Foto
```dart
GenericSection(
  title: 'Sobre',
  content: 'Texto sobre mim...',
  photo: 'images/minha_foto.jpg',
  photoBorderColor: CustomTheme.secondaryColor,
  photoWidth: 300,
  contentAlignment: CrossAxisAlignment.start,
)
```

### 3. Seção Sem Divisor
```dart
GenericSection(
  title: 'Título',
  content: 'Conteúdo...',
  showDivider: false,
)
```

### 4. Seção com Divisor Personalizado
```dart
GenericSection(
  title: 'Título',
  content: 'Conteúdo...',
  dividerIndent: 50,
  dividerEndIndent: 50,
)
```

## 🔄 Refatoração das Seções Existentes

### AboutSection (Antes)
```dart
// Código duplicado com 94 linhas
class AboutSection extends StatelessWidget {
  // ... implementação complexa
}
```

### AboutSection (Depois)
```dart
// Apenas 15 linhas!
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericSection(
      title: 'Sobre',
      content: Constants().aboutSec,
      showDivider: true,
      dividerIndent: 100,
      dividerEndIndent: 100,
    );
  }
}
```

## 📊 Benefícios da Refatoração

| Aspecto | Antes | Depois |
|---------|-------|--------|
| **Linhas de código** | 94 + 103 = 197 | 15 + 15 = 30 |
| **Manutenção** | Difícil (duplicado) | Fácil (centralizado) |
| **Consistência** | Variável | Garantida |
| **Reutilização** | Nenhuma | Total |
| **Tempo de desenvolvimento** | Alto | Baixo |

## 🎯 Casos de Uso Recomendados

- ✅ Seções de texto simples
- ✅ Seções com foto à direita
- ✅ Seções com conteúdo centralizado
- ✅ Seções com conteúdo alinhado à esquerda
- ✅ Qualquer seção que siga o padrão visual

## 🚫 Limitações

- ❌ Não suporta layouts muito complexos
- ❌ Não suporta múltiplas fotos
- ❌ Não suporta widgets customizados no conteúdo

## 🔮 Futuras Melhorias

- [ ] Suporte para múltiplas fotos
- [ ] Suporte para widgets customizados
- [ ] Animações de entrada
- [ ] Temas personalizáveis
- [ ] Suporte para grid layouts
