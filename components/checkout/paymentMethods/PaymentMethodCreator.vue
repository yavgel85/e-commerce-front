<template>
  <form action="#" @submit.prevent="store">
    <div class="field">
      <div id="card-element"></div>
    </div>

    <div class="field">
      <p class="control">
        <button class="button is-info" :disabled="storing">
          Store card
        </button>
        <a href="#" class="button is-text" @click.prevent="$emit('cancel')">
          Cancel
        </a>
      </p>
    </div>
  </form>
</template>

<script>
  export default {
    data () {
      return {
        stripe: null,
        card: null,
        storing: false
      }
    },

    methods: {
      async store () {
        this.storing = true

        const { token, error } = await this.stripe.createToken(this.card)

        if (error) {
          //
        } else {
          let response = await this.$axios.$post('payment-methods', {
            token: token.id
          })

          this.$emit('added', response.data)
        }

        this.storing = false
      }
    },

    mounted () {
      const stripe = Stripe('pk_test_TYooMQauvdEDq54NiTphI7jx', { locale: 'auto'})
      //const stripe = Stripe('pk_test_kjzrYyFONSIQLpg57n1R7QxZ')

      this.stripe = stripe

      this.card = this.stripe.elements().create('card', {
        style: {
          base: {
            iconColor: '#414347',
            color: '#240a0a',
            fontWeight: '500',
            fontFamily: 'Roboto, Open Sans, Segoe UI, sans-serif',
            fontSize: '16px',
            fontSmoothing: 'antialiased',
            ':-webkit-autofill': {
              color: '#fce883',
            },
            '::placeholder': {
              color: '#3273dc',
            },
          },
          invalid: {
            iconColor: '#ee55bf',
            color: '#94407b',
          },
        }
      })

      this.card.mount('#card-element')
    }
  }
</script>
