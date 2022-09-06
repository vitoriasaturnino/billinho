class InvoiceController < ApplicationController
  def index
    def show
      invoice = Invoice.find(params[:id])
      render json: {status: 'SUCCESS', message:'Loaded invoices', data:invoice},status: :ok
    end
  end

  def show
    invoice = Invoice.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'invoices listed', data:invoice}, status: :ok
  end
end
