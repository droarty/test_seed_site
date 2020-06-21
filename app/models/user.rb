# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  email             :string
#  fname             :string
#  lname             :string
#  sso_refresh_token :string
#  sso_token         :string
#  sso_type          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class User < ApplicationRecord
  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.fname = auth.info.first_name
      user.lname = auth.info.first_name
      user.sso_image = auth.info.image
      user.email = auth.info.email
    end
  end

  #   [1] pry(User)> auth
  # => {"provider"=>"google_oauth2",
  #  "uid"=>"104559341691457466694",
  #  "info"=>
  #   {"name"=>"dotals support",
  #    "email"=>"drdotals@gmail.com",
  #    "unverified_email"=>"drdotals@gmail.com",
  #    "email_verified"=>true,
  #    "first_name"=>"dotals",
  #    "last_name"=>"support",
  #    "image"=>"https://lh5.googleusercontent.com/-ycZyGKvpjYg/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucndSIqoWlutKMv4SKv2y_jTbdtmpA/photo.jpg"},
  #  "credentials"=>
  #   {"token"=>
  #     "ya29.a0AfH6SMBrcg6T-PUImqP5OWhUnwIIo5j_jJ0q8RPDeRrFYFLCDVrKEKA0IFi-wO9AhCbAqtvK5xyM33VgqCVMNGYXYZfnawa1aXmNl3EW17oEbsb9WiZC_RRlDZ9yNya16bD0pbRVoAO8XK3MzATrG_usT5X7vnqCDaU",
  #    "refresh_token"=>"1//0f_4gG2GbhYwbCgYIARAAGA8SNwF-L9IrVZKuCeCHUjaqTEBoNzVa9HxMLq9myT_rBVaHvW5imLr0L1_quPWq466SrnWzjSlr4rQ",
  #    "expires_at"=>1592665801,
  #    "expires"=>true},
  #  "extra"=>
  #   {"id_token"=>
  #     "eyJhbGciOiJSUzI1NiIsImtpZCI6ImIxNmRlMWIyYWIwYzE2YWMwYWNmNjYyZWYwMWY3NTY3ZTU0NDI1MmEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI2NzQ0NDM1MjQwMTYtNmdhMDhiMnRqYWkyNjg0dWk1ZzhyNmhsc3RlbnNrdm8uYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI2NzQ0NDM1MjQwMTYtNmdhMDhiMnRqYWkyNjg0dWk1ZzhyNmhsc3RlbnNrdm8uYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDQ1NTkzNDE2OTE0NTc0NjY2OTQiLCJlbWFpbCI6ImRyZG90YWxzQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoieS1iSVU2cVdYeXhmV0R6VU81Sk54QSIsIm5hbWUiOiJkb3RhbHMgc3VwcG9ydCIsInBpY3R1cmUiOiJodHRwczovL2xoNS5nb29nbGV1c2VyY29udGVudC5jb20vLXljWnlHS3ZwallnL0FBQUFBQUFBQUFJL0FBQUFBQUFBQUFBL0FNWnV1Y25kU0lxb1dsdXRLTXY0U0t2MnlfalRiZHRtcEEvczk2LWMvcGhvdG8uanBnIiwiZ2l2ZW5fbmFtZSI6ImRvdGFscyIsImZhbWlseV9uYW1lIjoic3VwcG9ydCIsImxvY2FsZSI6ImVuIiwiaWF0IjoxNTkyNjYyMjAyLCJleHAiOjE1OTI2NjU4MDJ9.vg5vUTOmpE_BUBTFAR1lOiULUY3glyHkranb9LQam1PejNEaYpwvpogxyzY0pTbd2igOwDwQh0RmFSnAiD85BexMGbzLNzt5LcpjjC0Zlw9qda7G-ae2WGL_glaAlVuJjkZ1NOE2UhgTZkbeUG8M3oSdMppiHNh64XB_xV-2zjwkTMjTQOptm74D_BZ5LsnoIExjPZUAq0PgAN_SYyuVzeFJGJk9i2Y-ZrhbOeBcUVcWgmHeR8yqjG8axTcYEi3oCV8flZPxnXnrOALpZ9XkKtdqLWmh9c9FEKMF6W8GbZU88w-bAptFdXoCAlVcdG8eqakHdbLLp9L2hZlTLXXR4Q",
  #    "id_info"=>
  #     {"iss"=>"https://accounts.google.com",
  #      "azp"=>"674443524016-6ga08b2tjai2684ui5g8r6hlstenskvo.apps.googleusercontent.com",
  #      "aud"=>"674443524016-6ga08b2tjai2684ui5g8r6hlstenskvo.apps.googleusercontent.com",
  #      "sub"=>"104559341691457466694",
  #      "email"=>"drdotals@gmail.com",
  #      "email_verified"=>true,
  #      "at_hash"=>"y-bIU6qWXyxfWDzUO5JNxA",
  #      "name"=>"dotals support",
  #      "picture"=>"https://lh5.googleusercontent.com/-ycZyGKvpjYg/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucndSIqoWlutKMv4SKv2y_jTbdtmpA/s96-c/photo.jpg",
  #      "given_name"=>"dotals",
  #      "family_name"=>"support",
  #      "locale"=>"en",
  #      "iat"=>1592662202,
  #      "exp"=>1592665802},
  #    "raw_info"=>
  #     {"sub"=>"104559341691457466694",
  #      "name"=>"dotals support",
  #      "given_name"=>"dotals",
  #      "family_name"=>"support",
  #      "picture"=>"https://lh5.googleusercontent.com/-ycZyGKvpjYg/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucndSIqoWlutKMv4SKv2y_jTbdtmpA/photo.jpg",
  #      "email"=>"drdotals@gmail.com",
  #      "email_verified"=>true,
  #      "locale"=>"en"}}}
end
