class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  include Math
  require 'descriptive_statistics'

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  def report
    @items = Item.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        update_minimum_stock
        format.html { redirect_to @item, notice: 'Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        update_minimum_stock
        format.html { redirect_to @item, notice: 'Produto atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Produto deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:code, :demand, :description, :units, orders_attributes: [:id, :period, :demand, :_destroy])
    end

    def update_minimum_stock
      Item.all.each do |item|

        unless item.orders.blank?
          pedidos = item.orders

          demands = []
          pedidos.each do |pedido|
            demands << pedido.demand
          end

          demand_mean = demands.mean

          # Atualiza a demanda total para o item
          item.update_attribute(:demand, demands.sum)

          security_factor = 1.645
          lead_time = 2
          minimum_stock = security_factor * demands.standard_deviation * Math.sqrt(lead_time)

          # Atualiza o estoque mínimo para o item
          item.update_attribute(:minimum_stock, minimum_stock)
        end
      end
    end
end
