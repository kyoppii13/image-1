<template>
  <div>
    <v-row justify="center" class="text-center" align="center">
      <v-col cols="12">名前： {{ user.name }}</v-col>
      <v-col cols="12">Email： {{ user.email }}</v-col>
      <v-col cols="12"
        ><span>プロフィール画像：</span>
        <v-avatar size="100"><img :src="user.profileImage" style="vertical-align: middle"></img
      ></v-avatar></v-col>

      <v-col cols="12">
        <v-btn text><NuxtLink to="/">トップページ</NuxtLink></v-btn>
      </v-col>
    </v-row>
    <progress-circle :isProgress="loadingUserData"></progress-circle>
  </div>
</template>

<script>
import Vue from 'vue'
export default Vue.extend({
  computed: {
    user() {
      return this.$store.state.user.user
    },
    loadingUserData() {
      return this.$store.state.user.loadingUser.processing
    },
  },
  created() {
    this.loadUser()
  },
  methods: {
    loadUser() {
      this.$store.dispatch('user/loadUser')
    },
  },
})
</script>

<style></style>
