class SessionsController < ApplicationController

  # GET /sessions or /sessions.json
  def index
    session[:user_id] = nil
    flash[:success] = "conta deslogada"
    redirect_to root_path
  end

  # GET /sessions/1 or /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions or /sessions.json
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Login feito com sucesso"
      redirect_to user
    else
    flash.now[:danger] = "Login ou senha incorretos"
      render 'new'
    end
    
  end

  # PATCH/PUT /sessions/1 or /sessions/1.json
  def update
  
  end

  # DELETE /sessions/1 or /sessions/1.json
  def destroy
    
  end
end
