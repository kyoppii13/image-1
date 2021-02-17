export const state = {
  snackbar: {
    text: '',
    color: 'black',
  },
}
export const mutations = {
  setSnackbar(state, snackbar) {
    state.snackbar = snackbar
  },
  closeSnackbar(state) {
    state.snackbar = {}
  },
}
export const getters = {}
export const actions = {
  setSnackbar({ commit }, snackbar) {
    commit('setSnackbar', snackbar)
  },
  closeSnackbar({ commit }) {
    commit('closeSnackbar')
  },
}
