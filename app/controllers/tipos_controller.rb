class TiposController < ApplicationController
  before_action :set_tipo, only: %i[ show edit update destroy ]

  def index
    @tipos = Tipo.all
  end

  def show
  end

  def new
    @tipo = Tipo.new
  end

  def edit
  end

  def create
    @tipo = Tipo.new(tipo_params)

    respond_to do |format|
      if @tipo.save
        format.html { redirect_to @tipo, notice: "El tipo de producto fue creado con éxito." }
        format.json { render :show, status: :created, location: @tipo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tipos.update(tipo_params)
        format.html { redirect_to @tipos, notice: "El tipo producto fue actualizado con éxio." }
        format.json { render :show, status: :ok, location: @tipos }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tipos.destroy
    respond_to do |format|
      format.html { redirect_to tipos_url, notice: "El producto fue eliminado con éxito." }
      format.json { head :no_content }
    end
  end

  private
  
    def set_tipo
      @tipos = Tipo.find(params[:id])
    end

    def tipo_params
      params.require(:tipo).permit(:tipo, :descripcion)
    end
end
