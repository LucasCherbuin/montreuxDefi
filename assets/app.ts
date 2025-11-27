import './styles/app.css';

import { createApp } from 'vue';
import HelloWorld from './components/HelloWorld.vue';

const app = createApp({
    components: {
        HelloWorld
    }
});

app.mount('#app');