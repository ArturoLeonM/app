require './app/reportes/productos_csv.rb'
require './app/reportes/productos_pdf.rb'
class ProductosController < ApplicationController
  before_action :set_producto, only: %i[ show edit update destroy ]
  # respond_to :html, :json, :csv 

  def index
    @productos = Producto.all


  end

  def show
  end

  def new
    @producto = Producto.new
  end

  def edit
  end

  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: "El producto fue creado con éxito." }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: "El producto fue actualizado con éxio." }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to productos_url, notice: "El producto fue eliminado con éxito." }
      format.json { head :no_content }
    end
  end  

  
  def impr
    send_data ProductosReporte.new.call,
    :type => 'text/csv; charset=iso-8859-1; header=present', 
    :disposition=>'attachment; filename=iprm.csv'
  end 

  def imprpdf
    pdf = ProductosPdf.new.call
    send_data pdf.render, :type => 'application/pdf', :disposition => 'inline', :filename => 'test.pdf'
  end

  private
  
  def set_producto
    @producto = Producto.find(params[:id])
  end

  def producto_params
    params.require(:producto).permit(:name, :descripcion, :precio, :tipo_id )
  end


end