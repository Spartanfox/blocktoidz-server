require 'test_helper'

class HighscoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @highscore = highscores(:one)
  end

  test "should get index" do
    get highscores_url
    assert_response :success
  end

  test "should get new" do
    get new_highscore_url
    assert_response :success
  end

  test "should create highscore" do
    assert_difference('Highscore.count') do
      post highscores_url, params: { highscore: {  } }
    end

    assert_redirected_to highscore_url(Highscore.last)
  end

  test "should show highscore" do
    get highscore_url(@highscore)
    assert_response :success
  end

  test "should get edit" do
    get edit_highscore_url(@highscore)
    assert_response :success
  end

  test "should update highscore" do
    patch highscore_url(@highscore), params: { highscore: {  } }
    assert_redirected_to highscore_url(@highscore)
  end

  test "should destroy highscore" do
    assert_difference('Highscore.count', -1) do
      delete highscore_url(@highscore)
    end

    assert_redirected_to highscores_url
  end
end
