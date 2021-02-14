<template>
  <v-row justify="center" align="center" class="text-center">
    <v-col cols="12">
      <!--  非ログイン時コンテンツ     -->
      <div v-if="!isLogin">
        <!-- <v-progress-circular indeterminate></v-progress-circular> -->
        <v-btn @click="login()"><v-icon>mdi-google</v-icon>login</v-btn>
      </div>
      <!--  ログイン時コンテンツ     -->
      <div v-else>
        <nuxt-link to="/mypage">mypage</nuxt-link>
      </div>
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'
import { mapActions } from 'vuex'
import firebase from '../plugins/firebase'

export default Vue.extend({
  data() {
    return {
      test: '',
    }
  },
  components: {},
  computed: {
    isLogin() {
      return this.$store.state.firebase.isLogin
    },
  },
  created() {
    firebase
      .auth()
      .getRedirectResult()
      .then((res) => {
        return new Promise((resolve, reject) => {
          if (res.credential) {
            resolve('success')
          } else {
            reject()
          }
        })
      })
      .then(() => {
        firebase
          .auth()
          .currentUser?.getIdToken(true)
          .then((idToken) => {
            localStorage.setItem('auth._token.local', idToken)
            this.$store.dispatch('firebase/setLogin', true)
            this.$axios.$post('/api/users').then((res) => {
              console.log(res)
            })
          })
      })
  },
  methods: {
    login() {
      this.$store.dispatch('firebase/login')
    },
  },
})
</script>

<style lang="scss" scoped></style>
