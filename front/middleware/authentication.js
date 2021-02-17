import firebase from 'firebase'

export default function ({ store, redirect, route }) {
  firebase.auth().onAuthStateChanged((user) => {
    if (user) {
      firebase
        .auth()
        .currentUser?.getIdToken(true)
        .then((idToken) => {
          localStorage.setItem('auth._token.local', idToken)
          store.dispatch('firebase/setLogin', true)
          console.log('aaaa')
        })
      if (route.name === 'login') {
        redirect('/')
      }
    } else {
      if (!store.state.firebase.isLogin && route.name === 'index') {
      } else if (!store.state.firebase.isLogin && route.name !== 'login') {
        redirect('/login')
      }
    }
    store.dispatch('firebase/setLoading', false)
  })
}
