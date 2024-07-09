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



const fetchData = async () => {
  try {
    const response = await axios.get('http://localhost:8000/api')
    message.value = response.data.message

    const var1 = process.env.VITE_API_URL
    console.log('var1:', var1)

  } catch (error) {
    message.value = 'Error fetching data'
  }
}
</script>
