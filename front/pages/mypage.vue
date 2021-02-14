<template>
  <div>
    profile
    {{ user }}
  </div>
</template>

<script>
import Vue from 'vue'
export default Vue.extend({
  computed: {
    user() {
      return this.$store.state.user.user
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
