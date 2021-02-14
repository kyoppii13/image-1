import firebase from '~/plugins/firebase'
import { requestState } from './common/request-state'

export const state = () => ({
  isLogin: false,
})

export const mutations = {
  setLogin(state, value) {
    state.isLogin = value
  },
  setLoading(state, value) {
    state.isLoading = value
  },
  logout(state) {
    state.isLogin = false
    state.idToken = ''
  },
}
export const actions = {
  setLogin({ commit }, value) {
    commit('setLogin', value)
  },
  setLoading({ commit }, value) {
    commit('setLoading', value)
  },
  login() {
    return firebase
      .auth()
      .signInWithRedirect(new firebase.auth.GoogleAuthProvider())
  },
  logout({ commit }) {
    return new Promise((resolve, reject) => {
      firebase
        .auth()
        .signOut()
        .then(() => {
          localStorage.removeItem('auth._token.local')
          commit('logout')
          resolve()
        })
    })
  },
}
