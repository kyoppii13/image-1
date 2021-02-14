import axios from 'axios'
import firebase from '~/plugins/firebase'
import { requestState } from './common/request-state'

export const state = {
  loadingUser: requestState.default(),
  error: undefined,
  user: undefined,
}
export const mutations = {
  loadUserRequest(state) {
    state.loadingUser = requestState.processing()
  },
  loadUserSuccess(state, user) {
    console.log(`success!!!!!! ${user}`)
    state.user = user
    state.loadingUser = requestState.success()
  },
  loadUserFailure(state, error) {
    state.error = error
    state.loadingUser = requestState.failure()
  },
}
export const getters = {}
export const actions = {
  loadUser({ commit }) {
    commit('loadUserRequest')
    this.$axios
      .get('http://localhost:5000/api/users/mypage')
      .then((res) => {
        commit('loadUserSuccess', res.data)
      })
      .catch((err) => {
        commit('loadUserFailure', err)
      })
  },
}
