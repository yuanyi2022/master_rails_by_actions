class Admin::TicketsController < Admin::BaseController
  def index
    @tickets = Ticket.page(params[:page] || 1).per(params[:per_page] || 10)
                     .order("id desc")
  end

  def new
    @tickets = Ticket.new
  end
  def create
    @tickets = Ticket.new(params.require(:ticket).permit!)
    if @tickets.save
      flash[:notice] = "Ticket created successfully"
      redirect_to admin_tickets_path
    else
      render action: :new
    end

  end

  def edit
    @tickets = Ticket.find(params[:id])
    render action: :new

  end

  def update
  @tickets = Ticket.find(params[:id])
  @tickets.attributes = params.require(:ticket).permit!
  if @tickets.save
    flash[:notice] = "Ticket updated successfully"
    redirect_to admin_tickets_path
  else
    render action: :new
  end
  end

  def destroy
    @tickets = Ticket.find(params[:id])
    if @tickets.destroy
      flash[:notice] = "Ticket deleted successfully"
      redirect_to admin_tickets_path
    else
      flash[:error] = "Ticket could not be deleted"
      redirect_to :back
    end
  end
end
