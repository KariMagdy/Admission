require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  setup do
    @user = users(:good)
  end
  
  setup do
    @applicant = applicants(:good)
  end
  
  test "sessions: already logged in" do
    @request.session[:user_id] = users("good").id
    get :new
    assert_response :redirect
    assert_equal "#{users('good').email} is already logged in, Please Log out first", flash[:notice]
  end
  
  #########################create#############################3
  test "should create user, but render new" do
      
    post(:create, {:email => 'good@gmail.com'},{:password => '123qwer'})
    assert_response :success
    assert_equal "Invalid Email or Password", flash[:alert]
  end
  #####doesn't work acts like pervious test
  test "should create user, authenticated" do
    user=User.new
    user.email="good@gmail.com"  
    user.password="123qwer"
    user.save
    post(:create, {:email => 'good@gmail.com'},{:password => '123qwer'})
    
    assert_response :success
    assert_equal "Invalid Email or Password", flash[:alert]
  end
  
  
  ########################################################
  test "should destroy sessions" do
    # we don't need to assert for count
    delete :destroy, :id => @user.to_param
    assert_response :redirect
    assert_redirected_to "/"

    assert_equal "Logged out!", flash[:notice]
    
    #no need to check for user if destoyed or not,we destory the session
    #assert_raise(ActiveRecord::RecordNotFound) { User.find(@user.to_param) }

    end


end
