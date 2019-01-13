class Admin::UsersController < Admin::ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_access, except: [:login, :reset_password, :forgot_password]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def login
    if login_params[:password].present?
      @user = User.find_by(email: login_params[:email]).try(:authenticate, login_params[:password])
      if @user
        session[:user] = @user
        redirect_to '/admin/reservations'
      else
        flash[:message] = 'Invalid username or password!'
      end
    end
  end

  def logout
    session[:user] = nil
    redirect_to '/admin/login'
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def forgot_password
    if request.POST.present?
      @user = User.where(email: params[:email]).first
      flash[:forgot_password_message] = 'Reset password link successfully sent!'
      unless @user.nil?
        password_token = BCrypt::Password.create(@user.password_digest)
        @user.update(reset_password_token: password_token)
        BidMailer.reset_password(@user, request.host).deliver_now
      end
    end
  end

  def reset_password
    @user = User.where(reset_password_token: params[:token]).first
    render file: 'public/404.html' if @user.nil? || params[:token].nil?

    if request.POST.present?
      if @user.update(reset_password_token: nil, password: params[:password],
                      password_confirmation: params[:password_confirmation]) == true
        flash[:reset_password_message] = 'Password successfully reset!'
        flash[:alert_class] = 'success'
        flash[:alert_icon] = 'ok-sign'
      else
        flash[:reset_password_message] = 'Password did not match!'
        flash[:alert_class] = 'danger'
        flash[:alert_icon] = 'exclamation-sign'
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :reset_password_token, :role)
  end

  def login_params
    params.permit(:email, :password)
  end
end
