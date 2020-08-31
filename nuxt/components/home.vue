<template>
  <div>
    <h1>Sample App</h1>
    <p>
      This is the home page for the
      <a href="https://railstutorial.jp/">Ruby on Rails Tutorial</a>
      sample application.
    </p>
  </div>
</template>

<script>
export default {
  head() {
    return {
      titleTemplate: process.env.PROJECT_NAME,
    };
  },
};
</script>

<style>
</style>