<template>
  <div class="hello">
    <h1>{{ message }}</h1>
    <button @click="changeMessage">Cliquer ici</button>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data() {
    return {
      message: 'Bonjour depuis Vue.js et Symfony!'
    }
  },
  methods: {
    changeMessage() {
      this.message = 'Message changé!';
    }
  }
}
</script>

<style scoped>
.hello {
  text-align: center;
  margin-top: 50px;
}

h1 {
  color: #42b983;
}

button {
  padding: 10px 20px;
  margin-top: 20px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #35a372;
}
</style>