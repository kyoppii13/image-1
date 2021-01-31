export let axios

export default ({ store, $axios }) => {
  $axios.defaults.baseURL = 'http://localhost:5000'

  $axios.onRequest((config) => {
    config.headers.common['Authorization'] = localStorage.getItem(
      'auth._token.local'
    )
  })

  axios = $axios
}
