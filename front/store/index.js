import firebase from '~/plugins/firebase'
export const state = () => {}
export const mutations = {}
export const actions = {
  login() {
    firebase.auth().signInWithRedirect(new firebase.auth.GoogleAuthProvider())
  },
  logout() {
    firebase
      .auth()
      .signOut()
      .then(() => {
        console.log('logout')
      })
  },
}
