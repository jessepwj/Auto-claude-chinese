import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

// Import English translation resources
import enCommon from './locales/en/common.json';
import enNavigation from './locales/en/navigation.json';
import enSettings from './locales/en/settings.json';
import enTasks from './locales/en/tasks.json';
import enWelcome from './locales/en/welcome.json';
import enOnboarding from './locales/en/onboarding.json';
import enDialogs from './locales/en/dialogs.json';
import enGitlab from './locales/en/gitlab.json';
import enTaskReview from './locales/en/taskReview.json';
import enTerminal from './locales/en/terminal.json';
import enErrors from './locales/en/errors.json';
import enChangelog from './locales/en/changelog.json';
import enGithub from './locales/en/github.json';
import enLinear from './locales/en/linear.json';
import enWorkspace from './locales/en/workspace.json';
import enContext from './locales/en/context.json';

// Import French translation resources
import frCommon from './locales/fr/common.json';
import frNavigation from './locales/fr/navigation.json';
import frSettings from './locales/fr/settings.json';
import frTasks from './locales/fr/tasks.json';
import frWelcome from './locales/fr/welcome.json';
import frOnboarding from './locales/fr/onboarding.json';
import frDialogs from './locales/fr/dialogs.json';
import frGitlab from './locales/fr/gitlab.json';
import frTaskReview from './locales/fr/taskReview.json';
import frTerminal from './locales/fr/terminal.json';
import frErrors from './locales/fr/errors.json';
import frChangelog from './locales/fr/changelog.json';
import frGithub from './locales/fr/github.json';
import frLinear from './locales/fr/linear.json';
import frWorkspace from './locales/fr/workspace.json';
import frContext from './locales/fr/context.json';

// Import Chinese translation resources
import zhCNCommon from './locales/zh-CN/common.json';
import zhCNNavigation from './locales/zh-CN/navigation.json';
import zhCNSettings from './locales/zh-CN/settings.json';
import zhCNTasks from './locales/zh-CN/tasks.json';
import zhCNWelcome from './locales/zh-CN/welcome.json';
import zhCNOnboarding from './locales/zh-CN/onboarding.json';
import zhCNDialogs from './locales/zh-CN/dialogs.json';
import zhCNGitlab from './locales/zh-CN/gitlab.json';
import zhCNTaskReview from './locales/zh-CN/taskReview.json';
import zhCNTerminal from './locales/zh-CN/terminal.json';
import zhCNErrors from './locales/zh-CN/errors.json';
import zhCNChangelog from './locales/zh-CN/changelog.json';
import zhCNGithub from './locales/zh-CN/github.json';
import zhCNLinear from './locales/zh-CN/linear.json';
import zhCNWorkspace from './locales/zh-CN/workspace.json';
import zhCNContext from './locales/zh-CN/context.json';

export const defaultNS = 'common';

export const resources = {
  en: {
    common: enCommon,
    navigation: enNavigation,
    settings: enSettings,
    tasks: enTasks,
    welcome: enWelcome,
    onboarding: enOnboarding,
    dialogs: enDialogs,
    gitlab: enGitlab,
    taskReview: enTaskReview,
    terminal: enTerminal,
    errors: enErrors,
    changelog: enChangelog,
    github: enGithub,
    linear: enLinear,
    workspace: enWorkspace,
    context: enContext
  },
  fr: {
    common: frCommon,
    navigation: frNavigation,
    settings: frSettings,
    tasks: frTasks,
    welcome: frWelcome,
    onboarding: frOnboarding,
    dialogs: frDialogs,
    gitlab: frGitlab,
    taskReview: frTaskReview,
    terminal: frTerminal,
    errors: frErrors,
    changelog: frChangelog,
    github: frGithub,
    linear: frLinear,
    workspace: frWorkspace,
    context: frContext
  },
  'zh-CN': {
    common: zhCNCommon,
    navigation: zhCNNavigation,
    settings: zhCNSettings,
    tasks: zhCNTasks,
    welcome: zhCNWelcome,
    onboarding: zhCNOnboarding,
    dialogs: zhCNDialogs,
    gitlab: zhCNGitlab,
    taskReview: zhCNTaskReview,
    terminal: zhCNTerminal,
    errors: zhCNErrors,
    changelog: zhCNChangelog,
    github: zhCNGithub,
    linear: zhCNLinear,
    workspace: zhCNWorkspace,
    context: zhCNContext
  }
} as const;

i18n
  .use(initReactI18next)
  .init({
    resources,
    lng: 'zh-CN', // Default language: Simplified Chinese (will be overridden by settings)
    fallbackLng: 'en', // Fallback to English if translation missing
    defaultNS,
    ns: ['common', 'navigation', 'settings', 'tasks', 'welcome', 'onboarding', 'dialogs', 'gitlab', 'taskReview', 'terminal', 'errors', 'changelog', 'github', 'linear', 'workspace', 'context'],
    interpolation: {
      escapeValue: false // React already escapes values
    },
    react: {
      useSuspense: false // Disable suspense for Electron compatibility
    }
  });

export default i18n;
