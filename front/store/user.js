import firebase from '~/plugins/firebase'
import { requestState } from './common/request-state'

export const state = {
  loadingUser: requestState.default(),
  error: undefined,
  user: {},
}
export const mutations = {
  loadingUserRequest(state) {
    state.loadingUser = requestState.processing()
  },
  loadingUserSuccess(state, user) {
    state.user = user
    state.loadingUser = requestState.success()
  },
  loadingUserFailure(state, error) {
    state.error = error
    state.loadingUser = requestState.failure()
  },
}
export const getters = {}
export const actions = {
  loadUser({ commit }) {
    commit('loadingUserRequest')
    this.$axios
      .get('http://localhost:5000/api/users/mypage')
      .then((res) => {
        commit('loadingUserSuccess', res.data)
      })
      .catch((err) => {
        commit('loadingUserFailure', err)
      })
  },
}
