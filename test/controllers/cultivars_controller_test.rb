require 'test_helper'

class CultivarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cultivar = cultivars(:one)
  end

  test "should get index" do
    get cultivars_url
    assert_response :success
  end

  test "should get new" do
    get new_cultivar_url
    assert_response :success
  end

  test "should create cultivar" do
    assert_difference('Cultivar.count') do
      post cultivars_url, params: { cultivar: { fruit_weight_gr: @cultivar.fruit_weight_gr, name: @cultivar.name, species_id: @cultivar.species_id } }
    end

    assert_redirected_to cultivar_url(Cultivar.last)
  end

  test "should show cultivar" do
    get cultivar_url(@cultivar)
    assert_response :success
  end

  test "should get edit" do
    get edit_cultivar_url(@cultivar)
    assert_response :success
  end

  test "should update cultivar" do
    patch cultivar_url(@cultivar), params: { cultivar: { fruit_weight_gr: @cultivar.fruit_weight_gr, name: @cultivar.name, species_id: @cultivar.species_id } }
    assert_redirected_to cultivar_url(@cultivar)
  end

  test "should destroy cultivar" do
    assert_difference('Cultivar.count', -1) do
      delete cultivar_url(@cultivar)
    end

    assert_redirected_to cultivars_url
  end
end
