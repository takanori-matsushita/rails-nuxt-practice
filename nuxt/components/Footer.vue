<template>
  <footer class="footer">
    <small>
      The
      <a href="https://railstutorial.jp/">Ruby on Rails Tutorial</a>
      by
      <a href="http://www.michaelhartl.com/">Michael Hartl</a>
    </small>
    <nav>
      <ul>
        <li>
          <nuxt-link to="/static_pages/about">About</nuxt-link>
        </li>
        <li>
          <nuxt-link to="/static_pages/contact">Contact</nuxt-link>
        </li>
        <li>
          <a href="http://news.railstutorial.org/">News</a>
        </li>
      </ul>
    </nav>
  </footer>
</template>

<script>
export default {};
</script>

<style lang="scss">
/* footer */

footer {
  margin-top: 45px;
  padding-top: 5px;
  border-top: 1px solid #eaeaea;
  color: #777;
  a {
    color: #555;
    &:hover {
      color: #222;
    }
  }
  small {
    float: left;
  }
  ul {
    float: right;
    list-style: none;
    li {
      float: left;
      margin-left: 15px;
    }
  }
}
</style>