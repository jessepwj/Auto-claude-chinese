# Translation Guide

This guide explains how to contribute translations to Auto Claude and maintain consistency across all supported languages.

## Supported Languages

Auto Claude currently supports three languages:

- **English (en)** — Default language
- **Français (fr)** — French
- **简体中文 (zh-CN)** — Simplified Chinese

## File Structure

All translation files are located in `apps/frontend/src/shared/i18n/locales/` with the following structure:

```
apps/frontend/src/shared/i18n/locales/
├── en/
│   ├── common.json         # General UI translations (buttons, labels, errors)
│   ├── navigation.json     # Navigation menu items
│   ├── settings.json       # Settings interface
│   ├── tasks.json          # Task management interface
│   ├── welcome.json        # Welcome screen
│   ├── onboarding.json     # Onboarding wizard
│   ├── dialogs.json        # Dialog boxes and confirmations
│   ├── gitlab.json         # GitLab integration
│   ├── terminal.json       # Terminal interface
│   ├── taskReview.json     # Task review interface
│   └── errors.json         # Error messages
├── fr/
│   └── (same structure)
└── zh-CN/
    └── (same structure)
```

## Configuration Files

Two additional files manage language support:

- **`apps/frontend/src/shared/i18n/index.ts`** — i18n initialization and resource imports
- **`apps/frontend/src/shared/constants/i18n.ts`** — Language list and type definitions

## Adding a New Translation

### 1. Add Translation to Existing Language

To add a new key to an existing namespace (e.g., `common.json`):

1. Add the key to **all language files** (en, fr, zh-CN) in the same location
2. Use nested structure for organization:

```json
{
  "buttons": {
    "newAction": "New Action"
  }
}
```

3. In your React component:

```tsx
import { useTranslation } from 'react-i18next';

const MyComponent = () => {
  const { t } = useTranslation('common');
  return <button>{t('buttons.newAction')}</button>;
};
```

### 2. Add a New Namespace

If adding a new feature that requires many translations:

1. Create new JSON files in all three language directories:
   - `apps/frontend/src/shared/i18n/locales/en/newfeature.json`
   - `apps/frontend/src/shared/i18n/locales/fr/newfeature.json`
   - `apps/frontend/src/shared/i18n/locales/zh-CN/newfeature.json`

2. Import the new files in `apps/frontend/src/shared/i18n/index.ts`:

```typescript
// Import English
import enNewFeature from './locales/en/newfeature.json';
// Import French
import frNewFeature from './locales/fr/newfeature.json';
// Import Chinese
import zhCNNewFeature from './locales/zh-CN/newfeature.json';

export const resources = {
  en: {
    // ... existing namespaces
    newfeature: enNewFeature
  },
  fr: {
    // ... existing namespaces
    newfeature: frNewFeature
  },
  'zh-CN': {
    // ... existing namespaces
    newfeature: zhCNNewFeature
  }
} as const;
```

3. Add the namespace to the `ns` array in `i18n.init()`:

```typescript
i18n.use(initReactI18next).init({
  // ...
  ns: ['common', 'navigation', /* ... */, 'newfeature'],
  // ...
});
```

### 3. Add a New Language

To add support for a new language (e.g., Spanish - es):

1. Create a new directory: `apps/frontend/src/shared/i18n/locales/es/`

2. Copy all JSON files from the `en/` directory and translate them

3. Update `apps/frontend/src/shared/constants/i18n.ts`:

```typescript
export type SupportedLanguage = 'en' | 'fr' | 'zh-CN' | 'es';

export const AVAILABLE_LANGUAGES = [
  { value: 'en' as const, label: 'English', nativeLabel: 'English' },
  { value: 'fr' as const, label: 'French', nativeLabel: 'Français' },
  { value: 'zh-CN' as const, label: 'Chinese (Simplified)', nativeLabel: '简体中文' },
  { value: 'es' as const, label: 'Spanish', nativeLabel: 'Español' }
] as const;
```

4. Import and register the new language in `apps/frontend/src/shared/i18n/index.ts`:

```typescript
// Import Spanish translation resources
import esCommon from './locales/es/common.json';
// ... (import all namespaces)

export const resources = {
  en: { /* ... */ },
  fr: { /* ... */ },
  'zh-CN': { /* ... */ },
  es: {
    common: esCommon,
    // ... (all namespaces)
  }
} as const;
```

## Translation Guidelines

### Consistency

- **Terminology**: Maintain consistent translations for technical terms across all files
- **Tone**: Match the tone of the original text (professional, friendly, technical)
- **Context**: Consider the UI context when translating

### Common Technical Terms

Use these standard translations for consistency:

| English | Français | 简体中文 |
|---------|----------|---------|
| Agent | Agent | 智能体 |
| Build | Build | 构建 |
| Spec | Spécification | 规格文档 |
| Worktree | Arbre de travail | 工作树 |
| Task | Tâche | 任务 |
| Terminal | Terminal | 终端 |
| Settings | Paramètres | 设置 |
| Project | Projet | 项目 |
| Repository | Dépôt | 仓库 |
| Merge | Fusion | 合并 |
| Commit | Commit | 提交 |

### Interpolation Variables

Always preserve interpolation variables exactly as they appear:

```json
{
  "greeting": "Hello {{name}}!",           // English
  "greeting": "Bonjour {{name}} !",        // French
  "greeting": "你好 {{name}}！"            // Chinese
}
```

**Variables include**: `{{name}}`, `{{count}}`, `{{error}}`, `{{date}}`, etc.

### Pluralization

Handle plural forms correctly:

```json
{
  "items": "{{count}} item",
  "items_plural": "{{count}} items"
}
```

### HTML and Special Characters

- Preserve HTML tags: `<strong>`, `<br/>`, etc.
- Escape quotes and special characters properly
- Maintain newlines (`\n`) where they appear

### Tone and Style

- **Settings and technical UI**: Professional, clear, concise
- **Welcome/onboarding**: Friendly, encouraging, helpful
- **Errors**: Clear, actionable, not alarming
- **Dialogs**: Direct, informative

## Testing Translations

### 1. Visual Testing

After adding translations:

1. Start the development server:
   ```bash
   cd apps/frontend
   npm run dev
   ```

2. Open the app and change the language in Settings

3. Navigate through all UI sections to verify:
   - All text is translated (no missing keys showing as `namespace:key`)
   - Text fits properly in UI elements (no overflow/truncation)
   - Interpolation variables are replaced correctly
   - Pluralization works as expected

### 2. JSON Validation

Ensure all JSON files are valid:

```bash
cd apps/frontend
npm run lint
```

This runs Biome which will catch JSON syntax errors.

### 3. Type Checking

Verify TypeScript types are correct:

```bash
cd apps/frontend
npm run typecheck
```

### 4. Build Testing

Test the production build:

```bash
cd apps/frontend
npm run build
npm run package  # Test packaging
```

## Translation Workflow

### For Contributors

1. **Fork the repository** and create a new branch:
   ```bash
   git checkout -b feat/i18n-improve-french
   ```

2. **Make your changes** to the translation files

3. **Test your changes** using the visual and automated tests above

4. **Commit with clear messages**:
   ```bash
   git commit -m "feat(i18n): improve French translations in settings"
   ```

5. **Create a pull request** targeting the `develop` branch

### For Maintainers

When reviewing translation PRs:

1. **Check completeness**: Verify all three languages are updated
2. **Verify consistency**: Ensure technical terms match established translations
3. **Test visually**: Run the app and check the UI in all languages
4. **Check interpolation**: Ensure variables are preserved correctly
5. **Run automated tests**: `npm run lint && npm run typecheck`

## Best Practices

### DO

- ✅ Always update ALL language files when adding new keys
- ✅ Preserve the exact structure and nesting of JSON files
- ✅ Keep interpolation variables intact
- ✅ Test in the running application
- ✅ Use consistent terminology
- ✅ Consider cultural context and conventions
- ✅ Keep translations concise for UI elements

### DON'T

- ❌ Hardcode strings in JSX/TSX components
- ❌ Add keys to only one language
- ❌ Modify or remove interpolation variables
- ❌ Change the structure or nesting without updating all languages
- ❌ Use machine translation without review
- ❌ Translate technical terms inconsistently
- ❌ Break JSON syntax

## Getting Help

If you have questions about translations:

1. Check existing translations for similar terms
2. Review the [CLAUDE.md](CLAUDE.md) file for project guidelines
3. Open a discussion on GitHub
4. Reference the [react-i18next documentation](https://react.i18next.com/)

## Resources

- **i18next Documentation**: https://www.i18next.com/
- **react-i18next Documentation**: https://react.i18next.com/
- **Project Contributing Guide**: [CONTRIBUTING.md](apps/frontend/CONTRIBUTING.md)
- **Architecture Documentation**: [ARCHITECTURE.md](shared_docs/ARCHITECTURE.md)
