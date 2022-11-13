module AuthHelper
  def http_login
    user = 'dbg_admin'
    pw = 'password' # TODO store in env
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end  
end