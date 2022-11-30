class InvoiceController < ApplicationController
  def index
    invoice = Invoice.order('created_at DESC')
    render json: { status: 'SUCCESS', message: 'invoices listed', data: invoice }, status: :ok
  end

  def show
    invoice = Invoice.order('created_at DESC')
    render json: { status: 'SUCCESS', message: 'invoices listed', data: invoice }, status: :ok
  end
end
