<template>
  <tr>
    <td width="180">
<!--      <img src="http://via.placeholder.com/60x60" alt="">-->
      <img class="image is-64x64" src="https://images.unsplash.com/photo-1462917882517-e150004895fa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" alt="">
    </td>
    <td>
      {{ product.product.name }} / {{ product.type }} {{ product.name }}
    </td>
    <td width="160">
      <div class="field">
        <div class="control">
          <div class="select is-fullwidth">
            <select v-model="quantity">
              <option value="0" v-if="product.quantity == 0">0</option>
              <option
                :value="x"
                v-for="x in product.stock_count"
                :key="x"
                :selected="x == product.quantity"
              >
                {{ x }}
              </option>
            </select>
          </div>
        </div>
      </div>
    </td>
    <td>
      {{ product.total }}
    </td>
    <td>
      <a href="" @click.prevent="destroyProduct(product.id)">Remove</a>
    </td>
  </tr>
</template>

<script>
  import { mapActions } from 'vuex'

  export default {
    computed: {
      quantity: {
        get () {
          return this.product.quantity
        },

        set (quantity) {
          this.update({ productId: this.product.id, quantity })
        }
      }
    },

    props: {
      product: {
        required: true,
        type: Object
      }
    },

    methods: {
      ...mapActions({
        destroy: 'cart/destroy',
        update: 'cart/update'
      }),

      destroyProduct (productId) {
        if (confirm('Are you sure?')) {
          this.destroy(productId)
        }
      },
    }
  }
</script>
