<template>
  <v-progress-circular
    class="progress-circle"
    v-show="isProgress"
    indeterminate
    color="primary"
    size="100"
  >
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

<style scoped>
.progress-circle {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
