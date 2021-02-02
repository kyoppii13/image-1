// export let axios

// export default ({ store, $axios }) => {
//   $axios.defaults.baseURL = 'http://localhost:5000'

//   $axios.onRequest((config) => {
//     config.headers.common['Authorization'] = localStorage.getItem(
//       'auth._token.local'
//     )
//   })

//   axios = $axios
// }

export default ({ $axios }) => {
  // $axios.defaults.baseURL = process.env.BASE_URL || 'http://localhost:5000'
  $axios.defaults.baseURL = 'http://localhost:5000'

  $axios.onRequest((config) => {
    config.headers.common['Authorization'] = localStorage.getItem(
      'auth._token.local'
    )
  })
}
