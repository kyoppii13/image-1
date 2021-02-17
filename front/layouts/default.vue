<template>
  <v-app>
    <v-app-bar :clipped-left="clipped" fixed app>
      <nuxt-link to="/">
        <v-toolbar-title v-text="title" />
      </nuxt-link>
      <v-spacer />
      <v-btn v-if="isLogin" @click="logout()" outlined>logout</v-btn>
      <v-avatar v-if="isLogin"><nuxt-link to="/mypage"><img :src="user.profileImage"></img></nuxt-link></v-avatar>
    </v-app-bar>
    <v-main>
      <snackbar></snackbar>
      <v-container>
        <nuxt />
      </v-container>
    </v-main>
    <v-footer :absolute="!fixed" app>
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
import Vue from 'vue'
export default Vue.extend({
  data() {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      items: [
        {
          icon: 'mdi-apps',
          title: 'Welcome',
          to: '/',
        },
        {
          icon: 'mdi-chart-bubble',
          title: 'Inspire',
          to: '/inspire',
        },
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'ImageQ',
    }
  },
  computed: {
    isLogin() {
      return this.$store.state.firebase.isLogin
    },
    user() {
      return this.$store.state.user.user
    }
  },
  methods: {
    logout() {
      this.$store.dispatch('firebase/logout')
    },
  },
  created() {
  },
})
</script>
