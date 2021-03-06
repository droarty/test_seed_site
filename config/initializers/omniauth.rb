# frozen_string_literal: true

OmniAuth.config.full_host = Rails.env.production? ? 'https://dotals.com' : 'http://localhost:3001'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
