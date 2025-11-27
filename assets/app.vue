<template>
  <v-app>
    <v-app-bar color="primary" prominent>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>Mon Application Symfony + Vuetify</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon @click="toggleTheme">
        <v-icon>{{ theme === 'light' ? 'mdi-weather-night' : 'mdi-weather-sunny' }}</v-icon>
      </v-btn>
    </v-app-bar>

    <v-navigation-drawer v-model="drawer" temporary>
      <v-list>
        <v-list-item prepend-icon="mdi-home" title="Accueil" value="home"></v-list-item>
        <v-list-item prepend-icon="mdi-account" title="Profil" value="profile"></v-list-item>
        <v-list-item prepend-icon="mdi-cog" title="Paramètres" value="settings"></v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-main>
      <v-container>
        <HelloWorld />
      </v-container>
    </v-main>

    <v-footer app>
      <v-spacer></v-spacer>
      <span>&copy; 2025 Mon Application</span>
    </v-footer>
  </v-app>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { useTheme } from 'vuetify';
import HelloWorld from './components/HelloWorld.vue';

export default defineComponent({
  name: 'App',
  
  components: {
    HelloWorld
  },
  
  setup() {
    const drawer = ref<boolean>(false);
    const theme = useTheme();
    
    const toggleTheme = (): void => {
      theme.global.name.value = theme.global.current.value.dark ? 'light' : 'dark';
    };

    return {
      drawer,
      theme: theme.global.name,
      toggleTheme
    };
  }
});
</script>