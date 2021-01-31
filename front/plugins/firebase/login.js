import firebase from '../firebase/index.js'

export default async () => {
  return await firebase.auth().onAuthStateChanged((user) => {
    console.log("auth's state changed!", user)
    if (user) {
      firebase
        .auth()
        .currentUser?.getIdToken(true)
        .then((idToken) => {
          localStorage.setItem('auth._token.local', idToken)
          console.log('set local storage')
        })
    } else {
      localStorage.removeItem('auth._token.local')
    }
  })
}
