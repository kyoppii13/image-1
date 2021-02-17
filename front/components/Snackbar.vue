<template>
  <v-snackbar :value="!!snackbar.text" top>
    {{ snackbar.text }}
    <template v-slot:action="{ attrs }">
      <v-btn icon v-bind="attrs" @click="close">
        <v-icon>mdi-close</v-icon>
      </v-btn>
    </template>
  </v-snackbar>
</template>

<script>
export default {
  computed: {
    snackbar() {
      return this.$store.state.ui.snackbar
    },
  },
  watch: {
    snackbar(value) {
      if (Object.keys(value).length > 0) {
        this.setTimeout()
      }
    },
  },
  methods: {
    setTimeout() {
      window.setTimeout(() => {
        this.close()
      }, 6000)
    },
    close() {
      this.$store.dispatch('ui/closeSnackbar')
    },
  },
}
</script>

<style></style>
