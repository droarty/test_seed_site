# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  email             :string
#  fname             :string
#  lname             :string
#  sso_image         :string
#  sso_refresh_token :string
#  sso_token         :string
#  sso_type          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
