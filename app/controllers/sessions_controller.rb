# frozen_string_literal: true

class SessionsController < ApplicationController
  def googleAuth
    # Get access tokens from the google server
    access_token = request.env['omniauth.auth']
    user = User.from_omniauth(access_token)

    redirect_to(root_path) && return unless user.new_record?

    user.sso_type = 'google'
    # Access_token is used to authenticate request made from the rails application to the google server
    user.sso_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.sso_refresh_token = refresh_token if refresh_token.present?
    user.save
    redirect_to root_path
  end
end
