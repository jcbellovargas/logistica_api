class Api::UsuariosController < ApplicationController
  include Interactor

  def index
    render json: Usuario.all
  end

  def create
    @user = Usuario.create(nombre: params[:nombre], password: params[:password])
    render json: @user
  end

  def login
    user = Usuario.find_by(nombre: params[:usuario], password: params[:password])
    render json: user.as_json
  end
end
