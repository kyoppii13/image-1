import { requestState } from './common/request-state'
import axios from '@nuxtjs/axios'

export const state = {
  uploading: requestState.default(),
  loadingQuestions: requestState.default(),
  questions: [],
}
export const mutations = {
  uploadingImageRequest(state) {
    state.uploading = requestState.processing()
  },
  uploadingImageSuccess(state, user) {
    state.user = user
    state.uploading = requestState.success()
  },
  loadingImageFailure(state, error) {
    state.error = error
    state.loadingUser = requestState.failure()
  },
  loadingQuestionsRequest(state) {
    state.loadingQuestions = requestState.processing()
  },
  loadingQuestionsSuccess(state, questions) {
    state.questions = questions
    state.loadingQuestions = requestState.success()
  },
  loadingQuestionsFailure(state, error) {
    state.error = error
    state.loadingQuestions = requestState.failure()
  },
}
export const getters = {}
export const actions = {
  async upload({ commit }, payload) {
    commit('uploadingImageRequest')
    const url = '/api/questions/'
    const config = {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      transformRequest: [
        function (data, headers) {
          return data
        },
      ],
    }

    await this.$axios
      .post(url, payload.question, config)
      .then((res) => {
        commit('uploadingImageSuccess', res.data)
      })
      .catch((err) => {
        commit('uploadingImageFailure', err)
      })
  },
  async loadQuestions({ commit }) {
    commit('loadingQuestionsRequest')
    const url = '/api/questions/'
    await this.$axios
      .get(url)
      .then((res) => {
        commit('loadingQuestionsSuccess', res.data)
      })
      .catch((err) => {
        commit('loadingQuestionsFailure', err)
      })
  },
}
