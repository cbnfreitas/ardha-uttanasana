<template>
  <q-page class="flex flex-center">
    <div>
      <q-btn @click="fetchData" label="Fetch Data" />
      <p>{{ message }}</p>
    </div>
  </q-page>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const message = ref('')

const var1 = import.meta.env.RENDER_EXTERNAL_URL
console.log('var1:', var1)

const var2 = import.meta.env.VITE_API_URL
console.log('var2:', var2)


const fetchData = async () => {
  try {
    const response = await axios.get(`${apiUrl}/api`)
    message.value = response.data.message
  } catch (error) {
    message.value = 'Error fetching data'
  }
}
</script>
