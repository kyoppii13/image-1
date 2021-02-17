<template>
  <div>
    <v-alert v-show="!!alertMessage.message">
      <div>{{ alertMessage.message }}</div>
      <ul>
        <li v-for="(detail, index) in alertMessage.details" :key="index">
          {{ detail }}
        </li>
      </ul>
    </v-alert>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  props: {
    alertMessage: {
      type: Object,
      default: () => {
        return {
          type: 'info',
          message: '',
          details: [],
        }
      },
    },
  },
})
</script>

<style></style>
