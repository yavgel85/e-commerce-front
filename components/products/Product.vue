<template>
  <div class="card">
    <div class="card-image">
      <figure class="image is-4by3">
        <nuxt-link :to="link">
<!--          <img src="https://bulma.io/images/placeholders/1280x960.png" alt="">-->
          <img src="https://images.unsplash.com/photo-1509785307050-d4066910ec1e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=2456&q=80" alt="">
        </nuxt-link>
      </figure>
    </div>
    <div class="card-content">
      <div class="media">
        <div class="media-content">
          <nuxt-link :to="link" class="title is-5">{{ product.name }}</nuxt-link>
        </div>
      </div>

      <div class="content">
        <p v-if="product.description">
          {{ product.description }}
        </p>

        <span class="tag is-rounded is-medium">{{ product.price }}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    product: {
      required: true,
      type: Object
    }
  },

  computed: {
    link () {
      return {
        name: 'products-slug',
        params: {
          slug: this.product.slug
        }
      }
    }
  }
}
</script>

