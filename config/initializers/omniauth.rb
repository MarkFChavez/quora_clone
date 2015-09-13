key = Rails.application.secrets.facebook_key
secret = Rails.application.secrets.facebook_secret

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, key, secret
end
