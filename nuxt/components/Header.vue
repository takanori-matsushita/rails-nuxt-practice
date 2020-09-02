<template>
  <header class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
      <nuxt-link to="/" id="logo">sample app</nuxt-link>
      <nav>
        <ul class="nav navbar-nav navbar-right">
          <li>
            <nuxt-link to="/">Home</nuxt-link>
          </li>
          <li>
            <nuxt-link to="/static_pages/help">Help</nuxt-link>
          </li>
          <li>
            <nuxt-link to="#">Log in</nuxt-link>
          </li>
        </ul>
      </nav>
    </div>
  </header>
</template>

<script>
export default {};
</script>

<style lang="scss">
/* header */

#logo {
  float: left;
  margin-right: 10px;
  font-size: 1.7em;
  color: white;
  text-transform: uppercase;
  letter-spacing: -1px;
  padding-top: 9px;
  font-weight: bold;
  &:hover {
    color: white;
    text-decoration: none;
  }
}
</style>