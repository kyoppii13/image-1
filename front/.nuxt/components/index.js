export { default as AlertMessage } from '../../components/AlertMessage.vue'
export { default as Logo } from '../../components/Logo.vue'
export { default as ProgressCircle } from '../../components/ProgressCircle.vue'
export { default as Snackbar } from '../../components/Snackbar.vue'
export { default as VuetifyLogo } from '../../components/VuetifyLogo.vue'

export const LazyAlertMessage = import('../../components/AlertMessage.vue' /* webpackChunkName: "components/alert-message" */).then(c => c.default || c)
export const LazyLogo = import('../../components/Logo.vue' /* webpackChunkName: "components/logo" */).then(c => c.default || c)
export const LazyProgressCircle = import('../../components/ProgressCircle.vue' /* webpackChunkName: "components/progress-circle" */).then(c => c.default || c)
export const LazySnackbar = import('../../components/Snackbar.vue' /* webpackChunkName: "components/snackbar" */).then(c => c.default || c)
export const LazyVuetifyLogo = import('../../components/VuetifyLogo.vue' /* webpackChunkName: "components/vuetify-logo" */).then(c => c.default || c)
