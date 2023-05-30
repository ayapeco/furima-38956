class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:show, :index]

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :email, :first_name, :first_name_kana, :family_name_kana, :birthday])
  end
end


  #private

  #def basic_auth
    #authenticate_or_request_with_http_basic do |username, password|
      #username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    #end
  #end
#end