if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_s1FIUptIaoivPYQ0cgRytIce',
    secret_key: 'sk_test_5PC4MaeswZqRxs1f6teJ1apK'
  }
end
