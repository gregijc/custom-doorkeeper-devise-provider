# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
    session[:return_to] = params[:return_to]
  end

  # def destroy
  #   super
  #   # redirect_to new_user_session_url
  # end


  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    # debugger
    if !session[:return_to].blank?
      redirect_to session[:return_to]
    else
      respond_with resource, location: after_sign_in_path_for(resource)
    end
    session.delete(:return_to)
  end

  # def new
  #   @user = User.new

  #   respond_to do |format|
  #     format.html
  #   end
  # end

  # def create
  #   @user = User.create!(user_params)
  #   sign_in_and_redirect @user
  # end

  ###
  private
  ###

  # def user_params
  #   user_params = params[:user]
  #   user_params ? user_params.permit(
  #       :email, :password, :password_confirmation, :remember_me)
  #     : {}
  # end
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
