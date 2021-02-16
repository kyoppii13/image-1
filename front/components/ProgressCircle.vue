<template>
  <v-progress-circular v-show="isProgress" indeterminate color="primary">
  </v-progress-circular>
</template>

<script>
export default {
  name: 'ProgressCircle',
  props: {
    isProgress: {
      type: Boolean,
      default: false,
    },
  },
}
</script>

<style></style>
