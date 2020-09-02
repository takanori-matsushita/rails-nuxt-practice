<template>
  <div>
    <Header />
    <div class="container">
      <nuxt />
      <Footer />
    </div>
  </div>
</template>

<script>
import Header from "~/components/Header.vue";
import Footer from "~/components/Footer.vue";
export default {
  components: {
    Header,
    Footer,
  },
};
</script>

<style>
</style>
