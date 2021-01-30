<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="8" md="6">{{ test }}</v-col>
    <v-btn @click="getTest()">button</v-btn>
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
    async getTest() {
      const url = 'http://localhost:5000/api/v1/test'
      const response = await this.$axios.$get(url)
      this.$data.test = response.hello
    },
  },
})
</script>

<style lang="scss" scoped></style>
