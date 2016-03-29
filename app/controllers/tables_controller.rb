class TablesController < ApplicationController

  before_action :authenticate

  def index
    @tables = Table.all
  end

  def show
    @table = Table.find(params[:id])
    @items = Item.all
    binding.pry
    @ticket = Ticket.where(table_id: (@table[:id]))
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)

    if @table.save
      redirect_to table_path(@table)
    else
      render new_table_path(@table)
    end
  end

  def edit
    @table = Table.find(params[:id])
    Ticket.where(table_id: (@table[:id]))
  end

  def update
    @table = Table.find(params[:id])
    @table.add_item(Item.find(params[:table][:id]))
    @table.update(table_params)
    redirect_to table_path(@table)
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy
    redirect_to tables_path
  end

  private

  def table_params
    params.require(:table).permit(:table_number, :guests, :paid, :gossip, :user_id)
  end

end
