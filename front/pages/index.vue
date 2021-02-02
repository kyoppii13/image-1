<template>
  <v-row justify="center" align="center" class="text-center">
    <v-col cols="12">
      <v-btn @click="login()"><v-icon>mdi-google</v-icon>login</v-btn>
      <v-btn @click="logout()">logout</v-btn>
      <v-btn @click="get()">get</v-btn>
    </v-col>
  </v-row>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      test: '',
    }
  },
  components: {},
  methods: {
    login() {
      this.$store.dispatch('login')
    },
    logout() {
      this.$store.dispatch('logout')
    },
    get() {
      this.$axios.$get('/api/v1/user').then((result) => {
        console.log(result)
      })
    },
  },
})
</script>

<style lang="scss" scoped></style>
