class Admin::TicketsController < Admin::BaseController
  def index
    @tickets = Ticket.page(params[:page] || 1).per(params[:per_page] || 10)
                     .order("id desc")
  end

  def new
    @ticket = Ticket.new
  end
  def create
    @ticket = Ticket.new(params.require(:ticket).permit!)
    if @ticket.save
      flash[:notice] = "Ticket created successfully"
      redirect_to admin_tickets_path
    else
      render action: :new
    end

  end

  def edit
    @ticket = Ticket.find(params[:id])
    render action: :new

  end

  def update
  @ticket = Ticket.find(params[:id])
  @ticket.attributes = params.require(:ticket).permit!
  if @ticket.save
    flash[:notice] = "Ticket updated successfully"
    redirect_to admin_tickets_path
  else
    render action: :new
  end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    if @ticket.destroy
      flash[:notice] = "Ticket deleted successfully"
      redirect_to admin_tickets_path
    else
      flash[:error] = "Ticket could not be deleted"
      redirect_to :back
    end
  end
end
