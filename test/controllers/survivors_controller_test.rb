require 'test_helper'

class SurvivorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survivor = survivors(:one)
  end

  test "should get index" do
    get survivors_url
    assert_response :success
  end

  test "should get new" do
    get new_survivor_url
    assert_response :success
  end

  test "should create survivor" do
    assert_difference('Survivor.count') do
      post survivors_url, params: { survivor: { age: @survivor.age, gender: @survivor.gender, infected: @survivor.infected, name: @survivor.name } }
    end

    assert_redirected_to survivor_url(Survivor.last)
  end

  test "should show survivor" do
    get survivor_url(@survivor)
    assert_response :success
  end

  test "should get edit" do
    get edit_survivor_url(@survivor)
    assert_response :success
  end

  test "should update survivor" do
    patch survivor_url(@survivor), params: { survivor: { age: @survivor.age, gender: @survivor.gender, infected: @survivor.infected, name: @survivor.name } }
    assert_redirected_to survivor_url(@survivor)
  end

  test "should destroy survivor" do
    assert_difference('Survivor.count', -1) do
      delete survivor_url(@survivor)
    end

    assert_redirected_to survivors_url
  end
end
