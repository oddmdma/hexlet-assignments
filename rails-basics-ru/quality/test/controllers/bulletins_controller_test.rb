# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get bulletins_url
    assert_response :success
  end

  test '#show' do
    bulletin = bulletins(:published)
    get bulletin_url(bulletin)
    assert_response :success
  end
end
