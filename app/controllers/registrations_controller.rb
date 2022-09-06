class RegistrationsController < ApplicationController
  # create registration
  def create    
    registration = Registration.new(registration_params)

    if registration.save && create_invoices(registration_params, registration.id)
      render json: {status: 'SUCCESS', message:'Saved registration', data:registration}, status: :ok
    else
      render json: {status: 'ERROR', message:'registration not saved', data:registration.errors}, status: :unprocessable_entity
    end
  end

  def index
    registration = Registration.order('created_at DESC');
    render json: {status: 'SUCCESS', message:'registrations listed', data:registration}, status: :ok
  end

  def show
    registration = Registration.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded registration', data:registration}, status: :ok
  end

  # Parametros aceitos
  private
  def registration_params
    params.permit(
      :amount,
      :invoice_quantity, # numero de parcelas
      :expiration_day,
      :course_name,
      :educational_institution_id,
      :student_id
    )
  end

  def create_invoices(params, registration_id)
    amount = params[:amount] 
    invoice_quantity = params[:invoice_quantity]
    expiration_day = params[:expiration_day].to_date
    invoice_amount = amount / invoice_quantity

    invoice_quantity.times do |index|
      one_day = Date.today.day + (index + 1)

      due_date = expiration_day <= Date.today.day ? expiration_day + one_day : expiration_day

      Invoice.new(invoice_amount: invoice_amount, due_date: due_date, registration_id: registration_id).save
    end
  end
end