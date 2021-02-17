<template>
<div>
  <v-row justify="center" align="center" class="text-center">
    <alert-message :alert-message="formError"></alert-message>
    <v-col cols="12">
      <!--  非ログイン時コンテンツ     -->
      <progress-circle :is-progress="isLoading"></progress-circle>
      <div v-if="!isLogin">
        <v-btn @click="login()" outlined
          ><v-icon>mdi-google</v-icon>login</v-btn
        >
      </div>
      <!--  ログイン時コンテンツ     -->
      <div v-else>
        <v-form ref="form" v-model="valid">
          <v-row justify="center" align="center" class="text-center">
            <v-col cols="7"
              ><v-file-input
                v-model="image"
                label="画像を選択"
                prepend-icon="mdi-image"
                @change="change"
              ></v-file-input
            ></v-col>
            <v-col cols="7">
              <v-card
                v-if="!imageUrl"
                width="200"
                height="200"
                style="line-height: 200px"
                class="mx-auto"
                outlined
              >
                画像
              </v-card>
              <img v-else :src="imageUrl" height="200"></img>
            </v-col>
          </v-row>
          <v-btn outlined @click="submit">投稿</v-btn>
        </v-form>
      </div>
    </v-col>
  </v-row>
  <v-row justify="center" align="center">
    <v-col v-for="(question, index) in questions" :key="index" cols="2">
      <v-card hover>
        <v-img :src="question.imageUrl"></v-img>
      </v-card>
    </v-col>
  </v-row>
</div>
</template>

<script lang="ts">
import Vue from 'vue'
import firebase from '../plugins/firebase'

export default Vue.extend({
  data() {
    return {
      valid: false,
      image: undefined,
      imageUrl: '',
    }
  },
  components: {},
  computed: {
    isLogin() {
      return this.$store.state.firebase.isLogin
    },
    isLoading() {
      return this.$store.state.firebase.isLoading
    },
    formError() {
      return this.$store.state.firebase.formError
    },
    uploadingSuccess() {
      return this.$store.state.question.uploading.success
    },
    questions(){
      return this.$store.state.question.questions
    }
  },
  watch:{
    uploadingSuccess(value){
      if(value){
        this.image = undefined
        this.imageUrl = ''
        this.$store.dispatch('ui/setSnackbar', {text: '投稿しました', color: 'orange'})
        this.loadQuestions()
      }
    },
    isLogin(value){
      if(value){
        this.loadQuestions()
        this.loadUser()
      }
    }
  },
  created() {
    // this.$store.dispatch('firebase/setLoading', true)
    firebase
      .auth()
      .getRedirectResult()
      .then((res) => {
        return new Promise((resolve, reject) => {
          if (res.credential) {
            resolve()
          } else {
            reject()
          }
        })
      })
      .then(() => {
        firebase
          .auth()
          .currentUser?.getIdToken(true)
          .then((idToken) => {
            localStorage.setItem('auth._token.local', idToken)
            this.$axios.$post('/api/users').then((res) => {
              this.$store.dispatch('firebase/setLogin', true)
            })
          })
          .catch((error) => {
            this.$store.dispatch('firebase/setFormError', error)
          })
      })
      .catch((error) => {
        this.$store.dispatch('firebase/setFormError', {message: 'error', details: ['ログインエラー']})
      })
  },
  methods: {
    login() {
      this.$store.dispatch('firebase/login')
    },
    change(value: Blob | null) {
      if (value) {
        const reader = new FileReader()
        reader.readAsDataURL(value)
        reader.addEventListener('load', () => {
          (this.imageUrl as any) = reader.result
        })
      }
    },
    submit() {
      const formData = new FormData()
      formData.append('image', this.image)
      this.$store.dispatch('question/upload', {question: formData})
    },
    loadUser() {
      this.$store.dispatch('user/loadUser')
    },
    loadQuestions() {
      this.$store.dispatch('question/loadQuestions')
    }
  },
})
</script>

<style lang="scss" scoped></style>
