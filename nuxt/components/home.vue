<template>
  <div>
    <div class="center jumbotron">
      <h1>Welcome to the Sample App</h1>

      <h2>
        This is the home page for the
        <a href="https://railstutorial.jp/">Ruby on Rails Tutorial</a>
        sample application.
      </h2>

      <nuxt-link to="/signup" class="btn btn-lg btn-primary">Sign up now!</nuxt-link>
    </div>

    <a href="http://rubyonrails.org/">
      <img src="/images/rails.png" alt="Rails logo" />
    </a>
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