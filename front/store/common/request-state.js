export const requestState = {
  default() {
    return {
      processing: false,
      success: false,
      failiure: false,
    }
  },
  processing() {
    return {
      processing: true,
      success: false,
      failiure: false,
    }
  },
  success() {
    return {
      processing: false,
      success: true,
      failiure: false,
    }
  },
  failure() {
    return {
      processing: false,
      success: false,
      failiure: true,
    }
  },
}
