require 'test_helper'

class GarbagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get garbages_index_url
    assert_response :success
  end
end
