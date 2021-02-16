import humps from 'humps'

const transformResponse = (data) => {
  return JSON.parse(JSON.stringify(humps.camelizeKeys(data)))
}
const transformRequest = (data) => {
  return data ? JSON.stringify(humps.decamelizeKeys(JSON.parse(data))) : data
}
export default ({ store, $axios }) => {
  $axios.defaults.baseURL = 'http://localhost:5000'

  $axios.onRequest((config) => {
    config.headers.common['Authorization'] = localStorage.getItem(
      'auth._token.local'
    )
    config.data = transformRequest(config.data)
    return config
  })

  $axios.onResponse((response) => {
    response = transformResponse(response)
    return response
  })
}
