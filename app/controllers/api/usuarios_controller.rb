class Api::UsuariosController < ApplicationController
  include Interactor

  def index
    render json: Usuario.all
  end

  def create
    @user = Usuario.create(nombre: params[:nombre], password: params[:password])
    render json: @user
  end
end
